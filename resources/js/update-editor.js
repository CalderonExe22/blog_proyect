import EditorJS from "@editorjs/editorjs";
import Header from "@editorjs/header";
import List from "@editorjs/list";
import ImageTool from "@editorjs/image";

document.addEventListener('DOMContentLoaded', ()=>{
    const editor = new EditorJS({
        /**
         * Id of Element that should contain the Editor
         */
        holder: "editorjs",

        /**
         * Available Tools list.
         * Pass Tool's class or Settings object for each Tool you want to use
         */
        tools: {
            header: {
                class: Header,
                config: {
                    placeholder: "Enter a header",
                    levels: [2, 3, 4, 5],
                    defaultLevel: 3,
                },
            },
            list: {
                class: List,
                inlineToolbar: true,
                config: {
                    defaultStyle: "unordered",
                },
            },
            image: {
                class: ImageTool,
                config: {
                    endpoints: {
                        byFile: "/categories/media", // Your backend file uploader endpoint
                        byUrl: "/categories/media", // Your endpoint that provides uploading by Url
                    },
                    additionalRequestData: {
                        _token: document.querySelector('meta[name="csrf"]').content, // Ajusta 'token' al valor del token CSRF de tu aplicación
                    },
                },
            },
        },
        data:JSON.parse(document.getElementById('editorData').value), // Cargar datos existentes
        onChange: ()=>{
            editor.save().then((outputData)=>{
                document.getElementById('editorData').value = JSON.stringify(outputData);
            }).catch((error)=>{
                console.log('Saving failed: ', error);
            })

            
        }
    });
});