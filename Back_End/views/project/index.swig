﻿{% extends 'layout.swig' %}

{% block page_body %}
<div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            프로젝트 목록
                        </h1>
                      
                    </div>
                </div>
<div class="row">
	
	
		<div id="container1">
			</div>
			<div class="p_Selector" data-toggle="modal" data-target="#basicModal">
			<div class="btext2">
			프로젝트 생성
			</div>
			</div>
		
	
</div>	

<!-- Modal창 정보-->
<div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        <form>
            <div class="modal-header">          
            <h4 id="myModalLabel">프로젝트 생성</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                <label>프로젝트 이름</label>
                <input type="text" id="project_name" placeholder="프로젝트 이름을 입력하세요" class="form-control">
                </div>

                <div class="form-group">
                  <div class="control-group">
                  <label class="control-label" for="datepicker0">시작일</label>
                    <div class="controls">
                    <input id="startDate" type="text">
                    </div>
                  </div>                  
                </div>

                <div class="form-group">
                  <div class="control-group">
                  <label class="control-label" for="datepicker0">종료일</label>
                    <div class="controls">
                    <input id="endDate" type="text">
                    </div>
                  </div>                  
                </div>

                <label>프로젝트 내용</label>
                <textarea id="project_explain" style="width:100%; border:1;overflow:visible;text-overflow:ellipsis; resize: none" rows="4"></textarea>

                <button type="button" class="btn btn-default" onclick="memAdd()" >멤버추가</button>
                 <button type="button" class="btn btn-default" onclick="memDel()" >멤버제거</button>
                 <br><br>
                <div id="member_list">
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" >창닫기</button>
                <button type="button" class="btn btn-default" onclick="createOk()" >프로젝트 생성</button>
       </div>
       </form>
     </div>
  </div>
</div>
<div class="modal fade" id="infoModal" tabindex="-2" role="dialog" aria-labelledby="infoModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        <form>
		 <div class="modal-header">          
            </div>
             <div class="modal-body" text-align="center">
			 <br>
                <h3>이 프로젝트를 활성화 시키시겠습니까?</h2>
			<br>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" onclick="project_activation()" data-dismiss="modal" >확인</button>
                <button type="button" class="btn btn-default" onclick="" data-dismiss="modal">취소</button>
       </div>
       </form>
     </div>
  </div>
</div>

<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        <form>
            <div class="modal-header">          
            <h4 class="modal-title" id="myModalLabel">프로젝트 정보</h4>

            </div>
            <div class="modal-body">
            <button type="button" class="btn btn-default" id="editpb" style="float:right;">수정</button>
			<button type="button" class="btn btn-default" id="editpbx" style="float:right;display:none">수정취소</button>
            <a style="float:right;">&nbsp;&nbsp;&nbsp;</a>
            <button type="button" class="btn btn-default" id="delpb" style="float:right;">삭제</button>
            <br>
                <div class="form-group">
                <label>프로젝트 이름</label>
                <input type="text" id="edit_name" placeholder="프로젝트 이름을 입력하세요" class="form-control" disabled>
                </div>

                <div class="form-group">
                  <div class="control-group">
                  <label class="control-label" for="datepicker0">시작일</label>
                    <div class="controls">
                    <input id="estartDate" type="text" disabled>
                    </div>
                  </div>                  
                </div>

                <div class="form-group">
                  <div class="control-group">
                  <label class="control-label" for="datepicker0">종료일</label>
                    <div class="controls">
                    <input id="eendDate" type="text" disabled>
                    </div>
                  </div>                  
                </div>

                <label>프로젝트 내용</label>
                <textarea id="edit_explain" style="width:100%; border:1;overflow:visible;text-overflow:ellipsis; resize: none" rows="4" disabled></textarea>

                <button type="button" id = "ememadd"class="btn btn-default" onclick="ememAdd2()" disabled>멤버추가</button>
                 <button type="button" id = "ememdel"class="btn btn-default" onclick="ememDel()" disabled>멤버제거</button>
                 <br><br>
                <div id="emember_list">
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" >닫기</button>
                <button type="button" class="btn btn-default" id="editcommit" style="display:none">수정완료</button>
       </div>
       </form>
     </div>
  </div>
</div>

{% endblock %}