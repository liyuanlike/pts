<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<script type="text/javascript">
	$(function() {
		$('.datepicker').datepicker({
			format : 'yyyy-mm-dd',
			language : 'zh-CN',
			todayBtn : "true",
			autoclose : true
		});

		if ("${success}") {
			$(".alert").alert();
			window.setInterval(function() {
				$(".alert").alert('close');
			}, 3000);
		} else {
			$(".alert").alert('close');
		}

		$('#addFileBtn')
				.click(
						function() {
							$('#attachementGroupDiv')
									.append(
											'<div class="controls"><input class="input-file" id="fileInput" type="file" name="attachment"></div>');
						});

		$.ajax({
			url : "<c:url value="/account_list.action"/>",
			data : {
				a : 123
			},
			success : function(data) {
				console.info(data);
				var accountList = data['accountList'];
				$.each(accountList, function(index, value) {
					$('#accountId').append(
							'<option value="' + value['id'] + '">'
									+ value['name'] + '</option>');
				});
			},
			failure : function() {

			},
			type : 'post',
			dataType : 'json'
		});
	});
</script>
</head>
<body>
	<div class="container">
			<div class="tabbable">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#1" data-toggle="tab">支出</a></li>
					<li><a href="#2" data-toggle="tab">收入</a></li>
				</ul>
				<div class="container">
					<div class="row">
						<div class="tab-content">
							<div class="tab-pane active" id="1">
								<form class="form-horizontal"
									action='<c:url value="/outgo_add.action"/>' method="post"
									enctype="multipart/form-data">
									<div class="container">
										<fieldset>
											<div class="alert alert-success">
												<a class="close" data-dismiss="alert" href="#">×</a> <strong>提示信息！</strong>
												支出信息添加成功
											</div>
											<div class="control-group">
												<label class="control-label" for="appendedInput">支出金额</label>
												<div class="controls">
													<div class="input-append">
														<input name="money" required="true" class="span3"
															id="appendedInput" size="16" type="text"><span
															class="add-on">.00</span>
													</div>
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">商家名称</label>
												<div class="controls">
													<input type="text" class="input-xlarge span3"
														name="tradeName">
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">支出账户</label>
												<div class="controls">
													<select class="span3" id="accountId" name="account.id"
														required="true">
													</select>
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">消费日期</label>
												<div class="controls">
													<input type="text" class="datepicker" name="outgoDate"
														required="true">
												</div>
											</div>
											<div class="control-group">
												<label class="control-label" for="fileInput">晒照片</label>
												<div class="controls">
													<input class="input-file" id="fileInput" type="file"
														name="attachment">
													<button type="button" class="btn" id="addFileBtn">添加</button>
													<p class="help-block">注意：上传的图片不能超过3M</p>
												</div>
											</div>
											<div id="attachementGroupDiv"></div>
											<div class="control-group">
												<label class="control-label" for="optionsCheckbox">晒单</label>
												<div class="controls">
													<label class="checkbox"> <input type="checkbox"
														id="optionsCheckbox" value="1" name="share">
														如果选中了好友可以查看你的消费记录
													</label>
												</div>
											</div>
											<div class="control-group">
												<label class="control-label" for="textarea">心得</label>
												<div class="controls">
													<textarea class="input-xlarge span5" id="textarea" rows="3"
														name="remark"></textarea>
												</div>
											</div>
											<div class="form-actions">
												<button type="submit" class="btn btn-primary"
													id="outgoSubmit">记一笔</button>
												<button class="btn">取消</button>
											</div>
										</fieldset>
									</div>
								</form>
							</div>
							<div class="tab-pane" id="2">
								<p>这里是章节 2.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- /container -->

</body>
</html>