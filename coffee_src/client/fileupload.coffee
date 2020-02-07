import h from 'react-hyperscript'
import React, {useState} from 'react'
import config from '../server/config'

upload_name = config.upload_name
upload_url = config.upload_url

FileUploadHooks = ()->
  [upload_file, setUploadFile] = useState(null)

  h 'form',
    method: 'post'
    action: upload_url
    enctype: 'multipart/form-data'
  , [
      h 'input',
        type: 'file'
        name: upload_name
        onChange: (e)->
          setUploadFile e.target.files[0]
      h 'input',
        type: 'submit'
    ]

class FileUploadClass extends React.Component
  constructor: (props)->
    super arguments...
    @state =
      file: null
  onChange: (e)=>
    @setState
      file: e.target.files[0]
  render: ()=>
    h 'form',
      method: 'post'
      action: upload_url
      enctype: 'multipart/form-data'
    , [
      h 'h3', 'Upload'
        h 'input',
          type: 'file'
          name: upload_name
          onChange: @onChange
        h 'input',
          type: 'submit'
      ]

module.exports = FileUploadHooks
