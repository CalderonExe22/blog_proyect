import EditorJS from '@editorjs/editorjs'; 
import Header from '@editorjs/header'; 
import List from '@editorjs/list'; 
import ImageTool from "@editorjs/image"

const form = document.querySelector('form'); 
const editor = new EditorJS({ 
  /** 
   * Id of Element that should contain the Editor 
   */ 
  holder: 'editorjs', 

  /** 
   * Available Tools list. 
   * Pass Tool's class or Settings object for each Tool you want to use 
   */ 
  tools: { 
    header: {
      class: Header,
      inlineToolbar: true,
      config: {
        placeholder: 'Enter a header',
        levels: [1 ,2, 3, 4, 5, 6],
      }
    }, 
    list: {
      class: List,
      inlineToolbar: true,
      config: {
        defaultStyle: 'unordered'
      }
    }, 
    image: {
      class: ImageTool,
      config: {
        endpoints: {
          byFile: '/post/media', // Your backend file uploader endpoint
          byUrl: '/post/media', // Your endpoint that provides uploading by Url
        },
        additionalRequestData: {
          _token : document.querySelector('meta[name="csrf"]').content // Ajusta 'token' al valor del token CSRF de tu aplicación
        }
      }
    }
    
  }, 
})

document.querySelector('form').addEventListener("submit",(e)=>{
  editor.save().then((outputData) => {
    document.getElementById('content').value = JSON.stringify(outputData);
  }).catch((error) => {
    console.log('Saving failed: ', error)
    e.preventDefault();
  });
})
