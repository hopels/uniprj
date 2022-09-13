ClassicEditor
	.create( document.querySelector('#editor'),{
		language:"ko",
		mediaEmbed: {
      		previewsInData: true
    	},
    	toolbar:['heading', '|', 'undo','redo','|', 'bold', 'italic', 'link', 'bulletedList', 'numberedList', 'blockQuote', 'ckfinder', 'mediaEmbed','uploadImage'],
    	ckfinder:{
			uploadUrl:'http://localhost:5080/boardFileUpload.do?',
			options:{
				resourceType:'Images'
			}
		}
	})
	.then( newEditor => {
		console.log(editor);
		editor = newEditor;
	})
	.catch( error => {
		console.error(error);
	});
