<template>
  <nm-container>
    <nm-list ref="list" v-bind="list">
      <!--查询条件-->
      <template v-slot:querybar>
        <el-form-item label="名称：" prop="name">
          <el-input v-model="list.model.name" clearable />
        </el-form-item>
        <el-form-item label="编码：" prop="code">
          <el-input v-model="list.model.code" clearable />
        </el-form-item>
      </template>

      <template v-slot:col-departmentName="{ row }">
        <span>{{ row.companyName }} / {{ row.departmentName }}</span>
      </template>

      <!--操作列-->
      <template v-slot:col-operation="{ row }">
        <nm-button-delete v-bind="buttons.del" :action="removeAction" :id="row.id" @success="refresh" />
      </template>
    </nm-list>
  </nm-container>
</template>
<script>
import page from './page'
import cols from './cols'

const api = $api.personnelFiles.position

export default {
  name: page.name,
  data() {
    return {
      curr: { id: '' },
      list: {
        title: page.title,
        cols,
        action: api.query,
        model: {
          /** 名称 */
          name: '',
          code: ''
        }
      },
      removeAction: api.remove,
      buttons: page.buttons
    }
  },
  methods: {
    refresh() {
      this.$refs.list.refresh()
    }
  }
}
</script>
