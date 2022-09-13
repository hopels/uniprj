ClassicEditor
	.create( document.querySelector('#editor2'),{
		language:"ko",
		mediaEmbed: {
      		previewsInData: true
    	},
    	toolbar:['bold', 'italic', 'link','|', 'bulletedList', 'numberedList']
	})
	.then( newEditor => {
		console.log(editor2);
		editor2 = newEditor;
	})
	.catch( error => {
		console.error(error);
	});
