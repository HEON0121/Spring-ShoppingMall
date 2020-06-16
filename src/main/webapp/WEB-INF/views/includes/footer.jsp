<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  		
  		 </div>
      <!-- /.col-lg-9 -->
  		
    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2020</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <!-- <script src="/vendor/jquery/jquery.min.js"></script> -->
  <!-- <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
  <!-- jQuery Modal -->
  <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" /> -->  
  	
  	<!-- 댓글 수정 모달 -->
		 <div class='modal fade' aria-hidden='false' tabindex='-1' id='reviewUpdateModal' role='dialog' aria-labelledby='reviewUpdateModalLabel'>
			<div class='modal-dialog'>
			<div class='modal-content'>
				<div class='modal-header'>
					<h4 class='modal-title' id='reviewUpdateModalLabel'>Update review </h4>
				</div>
				<div class='modal-body'>
					<textarea class='modal_reviewCon'>
						
					</textarea>
				</div>
				<div class='modal-footer'>
					<button type='button' class='btn btn-primary modal_modify_btn'>
					Save changes 
					</button>
					<button type='button' class='btn btn-danger' data-dismiss='modal'>
					Close
					</button>
				</div>
				<div class="modalBackground"></div>
			</div>
			</div>
		 </div> 
	<!--//모달   -->	
	<!-- 댓글 수정 모달 두번째 -->
	<!-- <div class="replyModal">

 	<div class="modalContent">
		<div>
   		<textarea class="modal_repCon" name="modal_repCon"></textarea>
  		</div>
  
  	<div>
   	<button type="button" class="modal_modify_btn btn-primary">수정</button>
   	<button type="button" class="modal_cancel btn-default">취소</button>
  	</div>
  
    </div>

 	<div class="modalBackground"></div> -->
 
</body>

</html>
