    </div>
    <script src="//<?=SITEURL;?>/redi-admin/templates/main/js/jquery-1.11.1.min.js"></script>
    <script src="//<?=SITEURL;?>/redi-admin/templates/main/js/bootstrap.min.js"></script>
    <script src="//<?=SITEURL;?>/redi-admin/templates/main/js/main.js"></script>
    <script type="text/javascript" src="http://<?=SITEURL;?>/redi-admin/plugins/tinymce/tinymce.min.js"></script>

<script type="text/javascript">
tinymce.init({
    external_filemanager_path:"plugins/filemanager/",
    filemanager_title:"Filemanager" ,
    mode : "specific_textareas",
    editor_selector : "content",
    content_css: "http://<?=SITEURL;?>/redi-admin/templates/main/style/css/bootstrap.min.css",
    plugins: [
        "advlist autolink lists link image charmap print preview anchor",
        "searchreplace visualblocks code fullscreen",
        "insertdatetime responsivefilemanager table contextmenu paste"
    ],
    toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link responsivefilemanager",
    setup : function(ed) {
      ed.on('keyup', function(e) {
         //createkeywords(ed.getContent());
          //console.log('Editor was clicked');
          //console.log(ed.getContent());
      });
   }
});

    
</script>

    </body>
</html>