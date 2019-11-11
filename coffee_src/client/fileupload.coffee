import h from 'react-hyperscript'
import React from 'react'
import axios from 'axios'
import config from '../server/config'

upload_name = config.upload_name
upload_url = config.upload_url

class FileUpload extends React.Component
  constructor: (props)->
    super arguments...
    @state =
      file: null
  onFormSubmit: (e)=>
    e.preventDefault()
    formData = new FormData()
    formData.append(upload_name, @state.file)
    axios_config =
#      baseURL: "#{location.host}"
      headers:
        'content-type': 'multipart/form-data'
    axios.post upload_url, formData, axios_config
    .then (res)->
      console.log JSON.stringify(res, null, 2)
    .catch (err)->
      console.log err
  onChange: (e)=>
    @setState
      file: e.target.files[0]
  render: ()=>
    h 'form',
      onSubmit: @onFormSubmit
    , [
        h 'input',
          type: 'file'
          name: upload_name
          onChange: @onChange
        h 'input',
          type: 'submit'
      ]

module.exports = FileUpload
