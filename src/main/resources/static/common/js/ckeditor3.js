ClassicEditor
	.create( document.querySelector('#editor3'),{
		language:"ko",
		mediaEmbed: {
      		previewsInData: true
    	},
    	toolbar:['bold', 'italic', 'link','|', 'bulletedList', 'numberedList']
	})
	.then( newEditor => {
		console.log(editor3);
		editor3 = newEditor;
	})
	.catch( error => {
		console.error(error);
	});
