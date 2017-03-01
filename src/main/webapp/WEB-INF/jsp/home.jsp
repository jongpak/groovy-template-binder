<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<form action="<c:url value="/render" />" target="rendered-iframe" method="post">
    <div class="form-group col-md-4">
    <p><label>스크립트</label></p>
    <p><textarea id="scriptTextarea" class="form-control" rows="25" cols="120" name="script"></textarea></p>
    </div>
    
    <div class="form-group col-md-4">
    <p>
        <label>템플릿</label>
        <input type="submit" value="Render" class="btn btn-primary btn-sm pull-right" />
    </p>
    <p><textarea id="templateTextarea" class="form-control" rows="25" cols="120" name="template"></textarea></p>
    </div>
</form>

<div class="col-md-4">
<p><label>렌더링 결과</label></p>
<iframe class="panel panel-default" width="100%" onload="this.height = this.contentWindow.document.body.scrollHeight + 20" name="rendered-iframe"></iframe>
<div id="scriptEditor" style="height: 50px"></div>
</div>

<script src="https://code.jquery.com/jquery-3.1.1.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.24.2/codemirror.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.24.2/mode/groovy/groovy.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.24.2/mode/htmlembedded/htmlembedded.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.24.2/mode/css/css.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.24.2/mode/javascript/javascript.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.24.2/mode/xml/xml.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.24.2/mode/htmlmixed/htmlmixed.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.24.2/addon/mode/multiplex.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.24.2/codemirror.css">

<style>
.CodeMirror {
    border: 1px solid #eee;
    height: auto;
}
</style>

<script>
var scriptEditor = CodeMirror.fromTextArea($("#scriptTextarea").get(0), {
    mode: 'groovy',
    lineNumbers: true,
    viewportMargin: Infinity,
    indentUnit: 8,
    tabSize: 8,
    indentWithTabs: true,
});

CodeMirror.defineMode("groovyTemplate", function(config) {
    return CodeMirror.multiplexingMode(
        CodeMirror.getMode(config, "text/html"),
        {
            open: "<\%", close: "%>",
            mode: CodeMirror.getMode(config, "groovy"),
            delimStyle: "delimit"
        }
    );
  });
  
var templateEditor = CodeMirror.fromTextArea($("#templateTextarea").get(0), {
    mode: 'groovyTemplate',
    lineNumbers: true,
    viewportMargin: Infinity,
    indentUnit: 8,
    tabSize: 8,
    indentWithTabs: true,
});
</script>