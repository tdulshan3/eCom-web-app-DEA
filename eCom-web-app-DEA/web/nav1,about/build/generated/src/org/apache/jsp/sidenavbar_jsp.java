package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class sidenavbar_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("  <meta charset=\"UTF-8\">\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("  <title>Computer Categories</title>\n");
      out.write("  \n");
      out.write("  <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css\">\n");
      out.write("  <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">\n");
      out.write("  <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css\">\n");
      out.write("  <link rel=\"stylesheet\" href=\"sidenavbar.css\">\n");
      out.write("  \n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("<div class=\"container\">\n");
      out.write("    \n");
      out.write("  <div class=\"sidebar\">\n");
      out.write("    <ul class=\"nav flex-column\">\n");
      out.write("      <li class=\"nav-item\">\n");
      out.write("        \n");
      out.write("        <a class=\"nav-link\" href=\"#\">\n");
      out.write("          <i class=\"fas fa-laptop\"></i>\n");
      out.write("          ASUS ROG\n");
      out.write("        </a>\n");
      out.write("      </li>\n");
      out.write("      \n");
      out.write("      <li class=\"nav-item\">\n");
      out.write("        <a class=\"nav-link\" href=\"#\">\n");
      out.write("          <i class=\"bi bi-laptop-fill\"></i>          POWERED NY ASUS\n");
      out.write("        </a>\n");
      out.write("      </li><li class=\"nav-item\">\n");
      out.write("        <a class=\"nav-link\" href=\"#\">\n");
      out.write("          <i class=\"fas fa-laptop\"></i>\n");
      out.write("          COMMERCIAL SOLUTIONS\n");
      out.write("        </a>\n");
      out.write("      </li>\n");
      out.write("      <li class=\"nav-item\">\n");
      out.write("        <a class=\"nav-link\" href=\"#\">\n");
      out.write("          <i class=\"fab fa-apple\"></i>\n");
      out.write("          APPLE PRODUCTS\n");
      out.write("        </a>\n");
      out.write("      </li><li class=\"nav-item\">\n");
      out.write("        <a class=\"nav-link\" href=\"#\">\n");
      out.write("          <i class=\"bi bi-controller\"></i>\n");
      out.write("          COSOLE GAMING\n");
      out.write("        </a>\n");
      out.write("      </li>\n");
      out.write("      <li class=\"nav-item\">\n");
      out.write("        <a class=\"nav-link\" href=\"#\">\n");
      out.write("          <i class=\"bi bi-easel2\"></i>\n");
      out.write("          GRAPHICS TABLET/TAB\n");
      out.write("        </a>\n");
      out.write("      </li><li class=\"nav-item\">\n");
      out.write("        <a class=\"nav-link\" href=\"#\">\n");
      out.write("          <i class=\"bi bi-laptop\"></i>\n");
      out.write("\n");
      out.write("          LAPTOP\n");
      out.write("        </a>\n");
      out.write("      </li>\n");
      out.write("      <li class=\"nav-item\">\n");
      out.write("        <a class=\"nav-link\" href=\"#\">\n");
      out.write("          <i class=\"fab fa-apple\"></i>\n");
      out.write("          DESKTOP WORKSTATIOS\n");
      out.write("        </a>\n");
      out.write("      </li><li class=\"nav-item\">\n");
      out.write("        <a class=\"nav-link\" href=\"#\">\n");
      out.write("          <i class=\"fas fa-laptop\"></i>\n");
      out.write("          GAMIG DESKTOP\n");
      out.write("        </a>\n");
      out.write("      </li>\n");
      out.write("      <li class=\"nav-item\">\n");
      out.write("        <a class=\"nav-link\" href=\"#\">\n");
      out.write("          <i class=\"bi bi-pc-display\"></i>\n");
      out.write("        BUDGET DESKTOP COMPUTERS\n");
      out.write("        </a>\n");
      out.write("      </li><li class=\"nav-item\">\n");
      out.write("        <a class=\"nav-link\" href=\"#\">\n");
      out.write("          <i class=\"bi bi-window-plus\"></i>\n");
      out.write("\n");
      out.write("          PROCESSORS\n");
      out.write("        </a>\n");
      out.write("      </li>\n");
      out.write("      <li class=\"nav-item\">\n");
      out.write("        <a class=\"nav-link\" href=\"#\">\n");
      out.write("          <i class=\"bi bi-memory\"></i>\n");
      out.write("          MEMORY(RAM)\n");
      out.write("        </a>\n");
      out.write("      </li><li class=\"nav-item\">\n");
      out.write("        <a class=\"nav-link\" href=\"#\">\n");
      out.write("          <i class=\"bi bi-sd-card-fill\"></i>\n");
      out.write("\n");
      out.write("          GRAPHIC CARDS\n");
      out.write("        </a>\n");
      out.write("      </li>\n");
      out.write("      <li class=\"nav-item\">\n");
      out.write("        <a class=\"nav-link\" href=\"#\">\n");
      out.write("          <i class=\"bi bi-file-easel-fill\"></i>\n");
      out.write("          POWER SUPPLY\n");
      out.write("        </a>\n");
      out.write("      </li><li class=\"nav-item\">\n");
      out.write("        <a class=\"nav-link\" href=\"#\">\n");
      out.write("          <i class=\"bi bi-fan\"></i>\n");
      out.write("        COOLING AND LIGHTIG\n");
      out.write("        </a>\n");
      out.write("      </li>\n");
      out.write("      <li class=\"nav-item\">\n");
      out.write("        <a class=\"nav-link\" href=\"#\">\n");
      out.write("          <i class=\"bi bi-floppy2\"></i>\n");
      out.write("          STORAGE & NAS\n");
      out.write("        </a>\n");
      out.write("      </li><li class=\"nav-item\">\n");
      out.write("        <a class=\"nav-link\" href=\"#\">\n");
      out.write("          <i class=\"bi bi-pc\"></i>\n");
      out.write("          CASINS\n");
      out.write("        </a>\n");
      out.write("      </li>\n");
      out.write("      <li class=\"nav-item\">\n");
      out.write("        <a class=\"nav-link\" href=\"#\">\n");
      out.write("          <i class=\"bi bi-display\"></i>\n");
      out.write("          MONITORS & ACCESSORIES\n");
      out.write("        </a>\n");
      out.write("      </li><li class=\"nav-item\">\n");
      out.write("        <a class=\"nav-link\" href=\"#\">\n");
      out.write("          <i class=\"bi bi-speaker\"></i>\n");
      out.write("\n");
      out.write("          SPEAKERS & HEADPHONES\n");
      out.write("        </a>\n");
      out.write("      </li>\n");
      out.write("      <li class=\"nav-item\">\n");
      out.write("        <a class=\"nav-link\" href=\"#\">\n");
      out.write("          <i class=\"bi bi-mouse2-fill\"></i>\n");
      out.write("          KEYBOARD ,MICE &GAMEPADS\n");
      out.write("                </a>\n");
      out.write("      </li><li class=\"nav-item\">\n");
      out.write("        <a class=\"nav-link\" href=\"#\">\n");
      out.write("          <i class=\"bi bi-hdd-stack\"></i>\n");
      out.write("          OPTICAL DRIVES & PRINTERS\n");
      out.write("        </a>\n");
      out.write("      </li>\n");
      out.write("      <li class=\"nav-item\">\n");
      out.write("        <a class=\"nav-link\" href=\"#\">\n");
      out.write("          <i class=\"bi bi-dice-3-fill\"></i>\n");
      out.write("\n");
      out.write("      GMING CHARS\n");
      out.write("        </a>\n");
      out.write("      </li><li class=\"nav-item\">\n");
      out.write("        <a class=\"nav-link\" href=\"#\">\n");
      out.write("          <i class=\"bi bi-modem\"></i>\n");
      out.write("          CABLE & COECTORS\n");
      out.write("        </a>\n");
      out.write("      </li>\n");
      out.write("      <li class=\"nav-item\">\n");
      out.write("        <a class=\"nav-link\" href=\"#\">\n");
      out.write("          <i class=\"bi bi-gift\"></i>\n");
      out.write("        GIFT VOUCHER\n");
      out.write("        </a>\n");
      out.write("      </li>\n");
      out.write("      \n");
      out.write("    </ul>\n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("\n");
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
