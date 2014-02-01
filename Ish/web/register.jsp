
<%-- 
    Document   : index
    Created on : 25.01.2014, 2:28:48
    Author     : Fariz
--%>
<%--<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
--%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css" />
<title>İş</title>
</head>

<body>
<div id="container">
		<div id="header"> 
        	<h1>Iş<span class="off">lazımdır?</span></h1>
            <h2></h2>
        </div>   
        
        <div id="menu">
        	<ul>
            	<li class="menuitem"><a href="index.jsp">Home</a></li>
                <li class="menuitem"><a href="about.jsp">About</a></li>
                <li class="menuitem"><a href="faq.jsp">Products</a></li>
              <li class="menuitem"><a href="contact.jsp">Contact</a></li>
            </ul>
        </div>
        
        <div id="leftmenu">

        <div id="leftmenu_top"></div>

				<div id="leftmenu_main">    
                
                <h4>Daxil ol</h4>
                    <div class="ex">
                     
                        <form name="login" action="logintest" method="post">
                        <h3>${sessionScope.errorMessage}</h3>
                        <%
 
            if(session.getAttribute("errorMessage") != null) {
                session.setAttribute("errorMessage","");
            }
        %>                       
                        <h3>İstifadəçi adı</h3> <input type="text" name="username" ><br>
                        <h3>Şifrə:<h3> <input type="password" name="password"><br>
                                        <input type="radio" name="saveme" class="check" id="check-1" /><p1>yadda saxla</p1>
                                        <h3>         <input type="submit" value="daxil ol"> 
                       <a href="register.jsp" style="color: #8FB2B2">burada təzəyəm</a></h3>
                                   		
                         	
                       
                        </form>
                        </div>        
                <ul>
                   
                    <li><a href="register.jsp">Registrasiyadan keç</a></li>
                    
                </ul>
</div>
                
                
        <div id="leftmenu_bottom">
            
        </div>
        </div>
        
        
        
        
		<div id="content">
        
        
                    <div id="content_top"><br>
                        
                    </div>
        <div id="content_main">
            <h3>Registrasiyadan keçin</h3>
            <p>Bizim səhifəmiz iki cür işçi vahidləri üçün nəzərdə tutulub.
                Burada siz həm yerləşdirilən iş elanları arasında sizə uyğun 
                olan vakansiyalara müraciət edə bilərsiniz, həm də ki burada 
                özləri haqqında məlumat yerləşdirən iş axtaran şəxslərin arasında 
                öz təşkilatınıza yararlı işçi seçə və öz elanınızla burada iş axtaran 
                şəxsləri cəlb edə bilərsiniz. Özünüz üçün iş axtarırsınızsa "İş axtarıram" düyməsinə 
                basın və registrasiyadan keçin.Yox əgər öz təşkilatınızı təmsil edirsinizsə 
                və işçi axtarırsınz, on zaman "İşçi axtarıram" düyməsinə basib registrasiyadan keçin.</p>
            <button onclick="myFunction2()">Iş axtaranam</button>
             <button onclick="myFunction1()">Işçi axtaranam</button>
            <script>
                function myFunction2()
                {
                    document.getElementById("company").style.display = "none";
                    
                    if(document.getElementById("worker").style.display!=="")
                    {
                        document.getElementById("worker").style.display = "";
                    }
                    else               
                        document.getElementById("worker").style.display = "none";
               
                     }
            </script>
             
            <script>
                function myFunction1()
                {
                    document.getElementById("worker").style.display = "none";
                    if(document.getElementById("company").style.display!=="")
                    {
                        document.getElementById("company").style.display = "";
                    }else               
                        document.getElementById("company").style.display = "none";
               
                     }
            </script>
             <div id="company" style="display:none;"  >
                  <form action="register" method="post"><br>
           <input type="hidden" name="hidden" value="company">
            İstifadəçi adınız:<br/> <input type="text" name="username"/> <br/>
            Şifrəniz:<br/><input type="password" name="password"/> <br/>
            Təşkilatın adı:<br/> <input type="text" name="name"> <br/>
          
                
           İşçi axtardığınız vakansiya:
            <br>
            <input list="ixtisaslar" name="ixtisaslar">
            <datalist id="ixtisaslar">
                
                <option value="vəkil">
                <option value="baş katibi">
               <option value="kargüzar">
               <option value="detektiv">  
                <option value="diplomat"> 
                <option value="qarovul">
                <option value="milisioner">  
                <option value="nazir">
                          
                <option value="notarius">  
                <option value="Təhlükəsizlik işçisi">
                  
                <option value="polis">  
                <option value="ittihamçı">  
                 
                <option value="müstəntiq">
                <option value="məhkəmə icraçısı">  
                <option value="həkim">  
                <option value="zindançı">  
                <option value="vəkil">
                  
                <option value="nəşriyyatçı">
  
                <option value="redaktor">
                  
                <option value="təshihatçı">  
                <option value="cildçi">
              
                <option value="qovluq">
  
                <option value="HTML-coder">
  
                <option value="Web-integrator">
  
                <option value="Web-dizayner">
  
                <option value="Web-proqramçı">
  
                <option value="site Administrator">
  
                <option value="Blogger">
  
                <option value="natiq">
  
                <option value="Encoder">
  
                <option value="Content Manager">
  
                <option value="copywriter">
  
                <option value="proqramçı">
  
                <option value="radist">
  
                <option value="System administrator">
  
                <option value="teleqrafçı">
  
                <option value="TV jurnalist">
  
                <option value="sınaqçı">
                          
                <option value="androloq">
  
                <option value="anestezioloq">
  
                <option value="veneroloq">
  
                <option value="virusoloq">
  
                <option value="Fövqəladə Həkim">

  
                <option value="ginekoloq">
  
                <option value="dermatoloq">
  
                <option value="dermatoloq">
  
                <option value="nutritionist">
  
                <option value="stomatoloq">
  
                <option value="Infektsionist">
  
                <option value="kardioloq">
  
                <option value="ürək">
  
                <option value="loqoped">
  
                <option value="masajçı">
  
                <option value="tibb bacısı">
  
                <option value="nevroloq">
  
                <option value="nevropatoloq">
  
                <option value="neyrocərrah">
  
                <option value="göz həkimi">
  
                <option value="onkoloq">
  
                <option value="ortoped">
  
                <option value="oftalmoloq">
  
                <option value="pediatr">
  
                <option value="Prosector">
  
                <option value="proctologist">
  
                <option value="psixiatr">
  
                <option value="psixoterapevt">
  
                <option value="reanimatologiya">
  
                <option value="seksoloq">
  
                <option value="İdman həkimi">
  
                <option value="terapevt">
  
                <option value="toksikolog">
  
                <option value="travmatoloq">
  
                <option value="uroloq">
  
                <option value="əczaçı">
  
                <option value="cərrah">
  
                <option value="Endocrinologist (hormon mütəxəssis)">
  
                <option value="arxeoloq">
                
  
                <option value="arxivçi">
  
                <option value="astronom">
  
                <option value="biblioqraf">
  
                <option value="Biomühəndis">
  
                <option value="bioloq">
  
                <option value="biofizik">
  
                <option value="biokimyaçı">
  
                <option value="botanik">
  
                <option value="şərqşünas">
  
                <option value="genetik">
  
                <option value="genetik mühəndis">
  
                <option value="hidroloqu">
  
                <option value="misirşünas">
  
                <option value="zooloq">
  
                <option value="ixtiraçı">
                <option value="sənətşünas">
  
                <option value="tarixçi">
  
                <option value="balıqşünas">
  
                <option value="layihəçi">
  
                <option value="kulturoloq">
  
                <option value="riyaziyyatçı">
  
                <option value="meteoroloq">
  
                <option value="mikrobioloq">
  
                <option value="nanotexnologiya">
  
                <option value="ornitoloq">
  
                <option value="paleontoloq">
  
                <option value="politoloq">
  
                <option value="Pedologist">
  
                <option value="teoloq">
  
                <option value="sosioloq">
  
                <option value="teoloq">
  
                <option value="fizik">
  
                <option value="filosof">
  
                <option value="kimyaçı">
  
                <option value="ekoloq">
  
                <option value="etnoqraf">

  
                <option value="loqoped">
  
                <option value="maarifpərvər">
  
                <option value="müəllim">
  
                <option value="Provost">
  
                <option value="psixoloq">
  
                <option value="rektor">
  
                <option value="Surdopedaqoq">
  
                <option value="Tiflopedaqoq">
  
                <option value="şərabçı">
  
                <option value="şirniyyatçı">
  
                <option value="qəssab">
  
                <option value="çörəkçi">
  
                <option value="aşpaz">
  
                <option value="dequstator">
  
                <option value="Kinolog">
  
                <option value="dilçi">
  
                <option value="tərcüməçi">
  
                <option value="alpinist">
  
                <option value="bərpaçı">
  
                <option value="nazir">
  
                <option value="yanğınsöndürən">
  
                <option value="Agronomist">
  
                <option value="baytar">
  
                <option value="sağıcı">
  
                <option value="besici">
  
                <option value="ovçu">
  
                <option value="çoban">
  
                <option value="arıçı">
  
                <option value="Traktor sürücüsü">
  
                <option value="fermer">
  
                <option value="balıqçı">

  
                <option value="sığorta agent">
  
                <option value="Hotel Administrator">
  
                <option value="Restaurant manager">
  
                <option value="Administrator gözəllik salonu">
  
                <option value="bufetçi">
  
                <option value="kitabxanaçı">
  
                <option value="Vizajist">
  
                <option value="yükləyici">
  
                <option value="dalandar">
  
                <option value="anbardar">
  
                <option value="Travel məsləhətçi">
  
                <option value="manikürçü">
  
                <option value="zibilçi">
  
                <option value="bərbər">
  
                <option value="hambal">
  
                <option value="poçtalyon">
  
                <option value="bağban">
  
                <option value="başmaqçı">
  
                <option value="qadın təmizlənməsi">
  
                <option value="qablaşdırıcı">
  
                <option value="Florist">
  
                <option value="atlet">
  
                <option value="aktyor">
  
                <option value="animator">
  
                <option value="sirk">
  
                <option value="memar">
  
                <option value="xoreoqraf">
  
                <option value="DJ">
  
                <option value="layihəçi">
  
                <option value="Designer Reklam">
                <option value="Modelyer">
  
                <option value="dirijor">
  
                <option value="jurnalist">
  
                <option value="biçici">
  
                <option value="recordist">
  
                <option value="illüstrator">
  
                <option value="Imagemaker">
  
                <option value="ssenarist">
  
                <option value="kinomexanik">
  
                <option value="kinooperator">
  
                <option value="kinorejissor">
  
                <option value="bəstəkar">
  
                <option value="tənqidçi">
  
                <option value="model">
  
                <option value="musiqiçi">
  
                <option value="yazıçı">
  
                <option value="dərzi">
  
                <option value="istehsalçı">
  
                <option value="heykəltəraş">
  
                <option value="tattooist">
  
                <option value="fotoqraf">
  
                <option value="Fashion model">
  
                <option value="xoreoqraf">
  
                <option value="rəssam">
  
                <option value="Kostyum">
  
                <option value="zərgər">
  
                <option value="çəlləkçi">
  
                <option value="buldozer">
  
                <option value="geoloq">
  
                <option value="mədənçi">
  
                <option value="Kimya Mühendisi">
  
                <option value="sınaqçı">
  
                <option value="kartoqraf">
  
                <option value="rəssam">
  
                <option value="usta">
  
                <option value="maşinist">
  
                <option value="metallurq">
  
                <option value="dülgər">
  
                <option value="qaynaqçı">
  
                <option value="çilingər">
  
                <option value="dəyirmançı">
  
                <option value="soyutma">
  
                <option value="kəşfiyyatçı">
               </datalist>
               <br>
                Təklif elədiyiniz aylıq maaş:<br>
                 <input type="number" name="salary" min="100" max="10000">
                
                <br>
            Elektron ünvanınız:
            <br/><input type="email" name="email"> 
            <br/>
            Daha ətraflı:<br> 
            <textarea name="about" rows="3" cols="50">
           
            </textarea> <br/>                       
            
            <input type="submit" name="registasiyadan keç" value="Register"/> &nbsp;
            <input type="reset" name="təmizlə" value="Clear"/>
         </form>
            <br/>
             </div>
            
            
            
            <div id="worker" style="display:none;"  >
        	 <form action="register" method="post"><br>
            <input type="hidden" name="hidden" value="worker">
            İstifadəçi adınız:<br/> <input type="text" name="username"/> <br/>
            Şifrəniz:<br/><input type="password" name="password"/> <br/>
            Adınız:<br/> <input type="text" name="name"> <br/>
            Soyadiniz: <br/><input type="text" name="surname"> <br/>
                <%-- <input type="button" onclick="myFunction1()"value="Iş axtaranam">
            <button onclick="myFunction2()">Işçi axtaranam</button>--%>
            <br/>

            Doğum tarixiniz:<br/>
            <input type="date" name="bday">
     
            <br/>
            
                
                
                <br>
                 
            <input type="radio" name="status" value="0">İşləyirəm</input> &nbsp;
            <input type="radio" name="status" value="1">İşsizəm</input> <br/>
            
             <br/>
            İxtisasınız:
            <br>
            <input list="ixtisaslar" name="ixtisaslar">
            <datalist id="ixtisaslar">
                
                <option value="vəkil">
                <option value="baş katibi">
               <option value="kargüzar">
               <option value="detektiv">  
                <option value="diplomat"> 
                <option value="qarovul">
                <option value="milisioner">  
                <option value="nazir">
                          
                <option value="notarius">  
                <option value="Təhlükəsizlik işçisi">
                  
                <option value="polis">  
                <option value="ittihamçı">  
                 
                <option value="müstəntiq">
                <option value="məhkəmə icraçısı">  
                <option value="həkim">  
                <option value="zindançı">  
                <option value="vəkil">
                  
                <option value="nəşriyyatçı">
  
                <option value="redaktor">
                  
                <option value="təshihatçı">  
                <option value="cildçi">
              
                <option value="qovluq">
  
                <option value="HTML-coder">
  
                <option value="Web-integrator">
  
                <option value="Web-dizayner">
  
                <option value="Web-proqramçı">
  
                <option value="site Administrator">
  
                <option value="Blogger">
  
                <option value="natiq">
  
                <option value="Encoder">
  
                <option value="Content Manager">
  
                <option value="copywriter">
  
                <option value="proqramçı">
  
                <option value="radist">
  
                <option value="System administrator">
  
                <option value="teleqrafçı">
  
                <option value="TV jurnalist">
  
                <option value="sınaqçı">
                          
                <option value="androloq">
  
                <option value="anestezioloq">
  
                <option value="veneroloq">
  
                <option value="virusoloq">
  
                <option value="Fövqəladə Həkim">

  
                <option value="ginekoloq">
  
                <option value="dermatoloq">
  
                <option value="dermatoloq">
  
                <option value="nutritionist">
  
                <option value="stomatoloq">
  
                <option value="Infektsionist">
  
                <option value="kardioloq">
  
                <option value="ürək">
  
                <option value="loqoped">
  
                <option value="masajçı">
  
                <option value="tibb bacısı">
  
                <option value="nevroloq">
  
                <option value="nevropatoloq">
  
                <option value="neyrocərrah">
  
                <option value="göz həkimi">
  
                <option value="onkoloq">
  
                <option value="ortoped">
  
                <option value="oftalmoloq">
  
                <option value="pediatr">
  
                <option value="Prosector">
  
                <option value="proctologist">
  
                <option value="psixiatr">
  
                <option value="psixoterapevt">
  
                <option value="reanimatologiya">
  
                <option value="seksoloq">
  
                <option value="İdman həkimi">
  
                <option value="terapevt">
  
                <option value="toksikolog">
  
                <option value="travmatoloq">
  
                <option value="uroloq">
  
                <option value="əczaçı">
  
                <option value="cərrah">
  
                <option value="Endocrinologist (hormon mütəxəssis)">
  
                <option value="arxeoloq">
                
  
                <option value="arxivçi">
  
                <option value="astronom">
  
                <option value="biblioqraf">
  
                <option value="Biomühəndis">
  
                <option value="bioloq">
  
                <option value="biofizik">
  
                <option value="biokimyaçı">
  
                <option value="botanik">
  
                <option value="şərqşünas">
  
                <option value="genetik">
  
                <option value="genetik mühəndis">
  
                <option value="hidroloqu">
  
                <option value="misirşünas">
  
                <option value="zooloq">
  
                <option value="ixtiraçı">
                <option value="sənətşünas">
  
                <option value="tarixçi">
  
                <option value="balıqşünas">
  
                <option value="layihəçi">
  
                <option value="kulturoloq">
  
                <option value="riyaziyyatçı">
  
                <option value="meteoroloq">
  
                <option value="mikrobioloq">
  
                <option value="nanotexnologiya">
  
                <option value="ornitoloq">
  
                <option value="paleontoloq">
  
                <option value="politoloq">
  
                <option value="Pedologist">
  
                <option value="teoloq">
  
                <option value="sosioloq">
  
                <option value="teoloq">
  
                <option value="fizik">
  
                <option value="filosof">
  
                <option value="kimyaçı">
  
                <option value="ekoloq">
  
                <option value="etnoqraf">

  
                <option value="loqoped">
  
                <option value="maarifpərvər">
  
                <option value="müəllim">
  
                <option value="Provost">
  
                <option value="psixoloq">
  
                <option value="rektor">
  
                <option value="Surdopedaqoq">
  
                <option value="Tiflopedaqoq">
  
                <option value="şərabçı">
  
                <option value="şirniyyatçı">
  
                <option value="qəssab">
  
                <option value="çörəkçi">
  
                <option value="aşpaz">
  
                <option value="dequstator">
  
                <option value="Kinolog">
  
                <option value="dilçi">
  
                <option value="tərcüməçi">
  
                <option value="alpinist">
  
                <option value="bərpaçı">
  
                <option value="nazir">
  
                <option value="yanğınsöndürən">
  
                <option value="Agronomist">
  
                <option value="baytar">
  
                <option value="sağıcı">
  
                <option value="besici">
  
                <option value="ovçu">
  
                <option value="çoban">
  
                <option value="arıçı">
  
                <option value="Traktor sürücüsü">
  
                <option value="fermer">
  
                <option value="balıqçı">

  
                <option value="sığorta agent">
  
                <option value="Hotel Administrator">
  
                <option value="Restaurant manager">
  
                <option value="Administrator gözəllik salonu">
  
                <option value="bufetçi">
  
                <option value="kitabxanaçı">
  
                <option value="Vizajist">
  
                <option value="yükləyici">
  
                <option value="dalandar">
  
                <option value="anbardar">
  
                <option value="Travel məsləhətçi">
  
                <option value="manikürçü">
  
                <option value="zibilçi">
  
                <option value="bərbər">
  
                <option value="hambal">
  
                <option value="poçtalyon">
  
                <option value="bağban">
  
                <option value="başmaqçı">
  
                <option value="qadın təmizlənməsi">
  
                <option value="qablaşdırıcı">
  
                <option value="Florist">
  
                <option value="atlet">
  
                <option value="aktyor">
  
                <option value="animator">
  
                <option value="sirk">
  
                <option value="memar">
  
                <option value="xoreoqraf">
  
                <option value="DJ">
  
                <option value="layihəçi">
  
                <option value="Designer Reklam">
                <option value="Modelyer">
  
                <option value="dirijor">
  
                <option value="jurnalist">
  
                <option value="biçici">
  
                <option value="recordist">
  
                <option value="illüstrator">
  
                <option value="Imagemaker">
  
                <option value="ssenarist">
  
                <option value="kinomexanik">
  
                <option value="kinooperator">
  
                <option value="kinorejissor">
  
                <option value="bəstəkar">
  
                <option value="tənqidçi">
  
                <option value="model">
  
                <option value="musiqiçi">
  
                <option value="yazıçı">
  
                <option value="dərzi">
  
                <option value="istehsalçı">
  
                <option value="heykəltəraş">
  
                <option value="tattooist">
  
                <option value="fotoqraf">
  
                <option value="Fashion model">
  
                <option value="xoreoqraf">
  
                <option value="rəssam">
  
                <option value="Kostyum">
  
                <option value="zərgər">
  
                <option value="çəlləkçi">
  
                <option value="buldozer">
  
                <option value="geoloq">
  
                <option value="mədənçi">
  
                <option value="Kimya Mühendisi">
  
                <option value="sınaqçı">
  
                <option value="kartoqraf">
  
                <option value="rəssam">
  
                <option value="usta">
  
                <option value="maşinist">
  
                <option value="metallurq">
  
                <option value="dülgər">
  
                <option value="qaynaqçı">
  
                <option value="çilingər">
  
                <option value="dəyirmançı">
  
                <option value="soyutma">
  
                <option value="kəşfiyyatçı">
            </datalist>
            <br>
            Elektron ünvanınız:
            <br/><input type="email" name="email"> 
            <br/>
            Özünüz haqqda əlavə etmək istədikləriniz: 
            <textarea name="about" rows="3" cols="50">
           
            </textarea> <br/>                       
            
            <input type="submit" name="registasiyadan keç" value="Register"/> &nbsp;
            <input type="reset" name="təmizlə" value="Clear"/>
         </form>
</div>
</div>
        <div id="content_bottom"></div>
            
            <div id="footer"><h3><a href="http://www.bryantsmith.com"></a></h3></div>
      </div>
   </div>
</body>
</html>
