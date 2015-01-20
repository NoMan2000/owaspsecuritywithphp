{"filter":false,"title":"badContactDemo.js","tooltip":"/public/js/badContactDemo.js","undoManager":{"mark":0,"position":0,"stack":[[{"group":"doc","deltas":[{"start":{"row":0,"column":0},"end":{"row":57,"column":0},"action":"insert","lines":["var field = document.getElementById('filename'), ","    countFiles = function countFiles(e) {","        console.log(\"Occurence\");","    if (this.files !== undefined) {","        var elems = this.form.elements,","            submitButton,","            len = this.files.length, ","            max = document.getElementsByName('MAX_FILE_SIZE')[0].value,","            maxfiles = this.getAttribute('data-maxfiles'),","            maxpost = this.getAttribute('data-postmax'),","            displaymax = this.getAttribute('data-displaymax'),","            filesize,","            toobig = [],","            filesBeingUploaded = '',","            messageInfo = document.querySelector('#fileUploadMessages'),","            total = 0,","            message = '';","","        if ($(\"#infoUploadFiles\").length > 0) {","            $(\"#infoUploadFiles\").remove();","        }","","        for (var i = 0; i < elems.length; i++) {","            if (elems[i].type == 'submit') {","                submitButton = elems[i];","                break;","            }","        }","        ","        for (i = 0; i < len; i++) {","            filesize = this.files[i].size;","            if (filesize > max) {","                toobig.push(this.files[i].name);","            }","            filesBeingUploaded += this.files[i].name;","            total += filesize;","        }","        if (toobig.length > 0) {","            message = 'The following file(s) are too big:\\n'","                    + toobig.join('\\n') + '\\n\\n';","        }","        if (total > maxpost) {","            message += 'The combined total exceeds ' + displaymax + '\\n\\n';","        }","        if (len > maxfiles) {","            message += 'You have selected more than ' + maxfiles + ' files';","        }","        if (message.length > 0) {","            submitButton.disabled = true;","            alert(message);","        } else {","            messageInfo.innerHTML += \"<h4 id='infoUploadFiles'> The following files were added:<br/>\" + filesBeingUploaded + \"<span>\";","            submitButton.disabled = false;","        }","    }","};","field.addEventListener('change', countFiles, false);",""]}]}]]},"ace":{"folds":[],"scrolltop":1006,"scrollleft":0,"selection":{"start":{"row":57,"column":0},"end":{"row":57,"column":0},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":{"row":42,"state":"start","mode":"ace/mode/javascript"}},"timestamp":1421546299428,"hash":"cd5a6eda5e77e9d2ebf4522be50a9f81a821ea29"}