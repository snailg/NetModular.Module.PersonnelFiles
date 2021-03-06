import module from '../../module'

export default name => {
  const root = `${module.code}/${name}/`
  const crud = $http.crud(root)
  const urls = {
    uploadPicture: root + 'UploadPicture',
    editContact: root + 'EditContact',
    updateContact: root + 'UpdateContact',
    contactDetails: root + 'contactDetails'
  }

  /**
   * 获取上传照片接口地址
   */
  const getUploadPictureUrl = () => {
    return $http.axios.defaults.baseURL + urls.uploadPicture
  }

  const editContact = id => {
    return $http.get(urls.editContact, { id })
  }

  const updateContact = params => {
    return $http.post(urls.updateContact, params)
  }

  const contactDetails = id => {
    return $http.get(urls.contactDetails, { id })
  }

  return {
    ...crud,
    getUploadPictureUrl,
    editContact,
    updateContact,
    contactDetails
  }
}
