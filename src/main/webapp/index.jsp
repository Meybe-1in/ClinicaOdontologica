<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@include file="components/header.jsp" %>
<%@include file="components/sideBar.jsp" %>
<%@include file="components/topBar.jsp" %>
            <!-- Main Content -->
            <div id="content">
                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
                    </div>

                    <!-- Illustrations -->
                        <div class="row">
                            <div class="col-lg-6 mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">¡Sonríe sin límites con nuestra gran promoción odontológica!</h6>
                                </div>
                                <div class="card-body">
                                    <div class="text-center">
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;"
                                            src="img/PROMO.png" alt="...">
                                    </div>
                                    <p>Porque nos preocupamos por tu salud bucal y queremos que luzcas una sonrisa perfecta. 
                                        Por eso, te ofrecemos un 20% de descuento en 
                                        todos nuestros tratamientos dentales, desde limpiezas profundas hasta ortodoncia y blanqueamientos.</p>
                        
                                </div>
                            </div>
                            <div class="col-lg-6 mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Nuestros servicios incluyen</h6>
                                </div>
                                <div class="card-body">
                                    <div class="text-center">
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;"
                                            src="img/SERVICE.png" alt="...">
                                    </div>
                                    <p>
                                    <p>-Limpieza dental y profilaxis.</p>
                                    <p>-Blanqueamiento dental.</p>
                                    <p>-Ortodoncia y brackets.</p>
                                    <p>-Tratamientos de caries y endodoncias.</p>
                                    <p>-Implantes dentales.</p>
                                    <p>-Y mucho más...</p>  
                                    </p>
                        
                                </div>
                            </div>
                        </div>
            </div>
            <!-- End of Main Content --> 
<%@include file="components/footer.jsp" %>        
</html>