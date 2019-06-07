<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Probando_cositas.aspx.vb" Inherits="GestionTurnos.Probando_cositas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <!-- CSS y distintas librerias -->

    <asp:Literal ID="bootstrap_min_css" runat="server"></asp:Literal>
    <asp:Literal ID="jquery_1_9_1_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootstrap_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootbox_min_js" runat="server"></asp:Literal>
    <script>
        
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
/* particlesJS('dom-id', params);
/* @dom-id : set the html tag id [string, optional, default value : particles-js]
/* @params: set the params [object, optional, default values : check particles.js] */
 
/* config dom id (optional) + config particles params */
particlesJS('particles-js', {
  particles: {
    color: '#fff', // Color del vertice
    color_random: false,
    shape: 'circle', // "circle", "edge" or "triangle" // Establecemos cual de las 3 figuras queremos para vertice
    opacity: {
      opacity: 1, // Opacidad del vertice
      anim: {
        enable: true,
        speed: 1.5,
        opacity_min: 0,
        sync: false
      }
    },
    size: 4,
    size_random: true,
    nb: 150,
    line_linked: {
      enable_auto: true,
      distance: 100,
      color: '#fff', // Color de la arista
      opacity: 1, // Opacidad de la arista
      width: 1,
      condensed_mode: {
        enable: false,
        rotateX: 600,
        rotateY: 600
      }
    },
    anim: {
      enable: true,
      speed: 1 // Velocidad a la que se mueven las aristas
    }
  },
  interactivity: {
    enable: true,
    mouse: {
      distance: 300
    },
    detect_on: 'canvas', // "canvas" or "window"
    mode: 'grab', // "grab" of false
    line_linked: {
      opacity: .5
    },
    events: {
      onclick: {
        enable: true,
        mode: 'push', // "push" or "remove"
        nb: 4
      },
      onresize: {
        enable: true,
        mode: 'out', // "out" or "bounce"
        density_auto: false,
        density_area: 800 // nb_particles = particles.nb * (canvas width *  canvas height / 1000) / density_area
      }
    }
  },
  /* Retina Display Support */
  retina_detect: true
});
    </script>
</head>
<body id="particles-js">
    <form id="form1" runat="server">
        <div>
            ieeeeeee
        </div>
    </form>
</body>
</html>
