package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class about_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>About Us</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"about.css\">\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <header>\n");
      out.write("        <!-- Add your navigation bar here if needed -->\n");
      out.write("    </header>\n");
      out.write("\n");
      out.write("    <main>\n");
      out.write("        <section id=\"about\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"about-content\">\n");
      out.write("                    <h2>About Us</h2>\n");
      out.write("                    <div class=\"image\">\n");
      out.write("                        <img src=\"images/medium.jpg\" width=\"1200\" height=\"500\" alt=\"Image description\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"text\">\n");
      out.write("                        <p>Oh\n");
      out.write("                            Rust about us\n");
      out.write("                            Founded in 2018,nexus Computer Solutions strives to be one of the leading resellers of branded\n");
      out.write("                             and customizable computers and related products on the market today. Our many years of experience have\n");
      out.write("                              given us the expertise to provide you with services; our valued customers with the latest technology, \n");
      out.write("                              providing excellent service resulting in the best products available.nexus Computer Solutions has\n");
      out.write("                               always been a stable background for many PC enthusiasts, given the growing enthusiasm for high-end\n");
      out.write("                                computer games and custom computers. This is how dreams come true to build your own computer that\n");
      out.write("                                 will fit every need.</p>\n");
      out.write("                <p>Other PC enthusiasts will also be happy to provide any assistance needed to find the solution you believe in.\n");
      out.write("                     Specializing in providing the latest technology in the field of translation, our products are manufactured \n");
      out.write("                     after 6 years of impeccable quality. They didn't have a good reputation.</p>\n");
      out.write("               <p>nexus Computer Solutions has the ability to propose the ideal solution that meets your expectations.\n");
      out.write("                 The brands we have chosen speak for themselves of excellent high-end hardware.</p>\n");
      out.write("            <p>We understand what it means to have the trust of thousands of customers, and we intend to maintain that trust \n");
      out.write("                by continuing to provide the best products at the right prices. It is our responsibility to meet your needs in\n");
      out.write("                 building your ideal computer. My personal experience as a nexus customer has been great. Entrepreneurs are also \n");
      out.write("                 active in offering advice on choosing and customizing the ideal computer. We want to offer you the best products for\n");
      out.write("                  your budget, and in this regard we recognize that our direct involvement in helping you understand our products better \n");
      out.write("                  can be very helpful. doing.\n");
      out.write("            Technology plays an important role in the development of today's world. We at nexus Computer Solutions always keep our\n");
      out.write("             promises and put our customers first, and we believe that adapting to the world's technology scene, including on an international\n");
      out.write("              scale, has given us the opportunity to get to where we are today. I am. A pioneer of IT products in Japan.</p>\n");
      out.write("            </div>\n");
      out.write("            </div>\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("    </main>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
