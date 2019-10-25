using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using NetModular.Lib.Data.Abstractions;
using NetModular.Lib.Data.Core;
using NetModular.Lib.Data.Query;
using NetModular.Lib.Utils.Core.Extensions;
using NetModular.Module.Admin.Domain.Account;
using NetModular.Module.PersonnelFiles.Domain.Company;
using NetModular.Module.PersonnelFiles.Domain.Department;
using NetModular.Module.PersonnelFiles.Domain.Position;
using NetModular.Module.PersonnelFiles.Domain.Position.Models;

namespace NetModular.Module.PersonnelFiles.Infrastructure.Repositories.SqlServer
{
    public class PositionRepository : RepositoryAbstract<PositionEntity>, IPositionRepository
    {
        public PositionRepository(IDbContext context) : base(context)
        {
        }

        public async Task<IList<PositionEntity>> Query(PositionQueryModel model)
        {
            var paging = model.Paging();

            var query = Db.Find();
            query.WhereNotEmpty(model.DepartmentId, m => m.DepartmentId == model.DepartmentId);
            query.WhereNotNull(model.Name, m => m.Name.Contains(m.Name));
            query.WhereNotNull(model.Code, m => m.Code == model.Code);

            var joinQuery = query.LeftJoin<AccountEntity>((x, y) => x.CreatedBy == y.Id)
                .LeftJoin<DepartmentEntity>((x, y, z) => x.DepartmentId == z.Id)
                .LeftJoin<CompanyEntity>((x, y, z, m) => z.CompanyId == m.Id);

            if (!paging.OrderBy.Any())
            {
                joinQuery.OrderByDescending((x, y, z, m) => x.Id);
            }

            joinQuery.Select((x, y, z, m) => new { x, DepartmentName = z.Name, CompanyName = m.Name, Creator = y.Name });

            var result = await joinQuery.PaginationAsync(paging);
            model.TotalCount = paging.TotalCount;

            return result;
        }

        public Task<bool> Exists(PositionEntity entity)
        {
            var query = Db.Find(m => m.DepartmentId == entity.DepartmentId);

            if (entity.Code.NotNull())
            {
                query.Where(m => m.Name == entity.Name || m.Code == entity.Code);
            }
            else
            {
                query.Where(m => m.Name == entity.Name);
            }

            query.WhereNotEmpty(entity.Id, m => m.Id != entity.Id);

            return query.ExistsAsync();
        }

        public Task<IList<PositionEntity>> QueryByDepartment(Guid departmentId)
        {
            return Db.Find(m => m.DepartmentId == departmentId).ToListAsync();
        }
    }
}
