% Codigo para introducir angulos y longitud de prismatico en en robot RPR

%Lo que hace el codigo es definir cada Link de nuestro robot
% atraves de los 4 parametros de Denavit-Hartenberg.
 
% El primer Link es uno de revolucion, nuestro robot no pudo ser identico al
% propuesto en el problema, pero solo graficamente, ya que uno de los brazos
% se dibujo en la parte superior.
% Nos fue imposible dibujarlo por la parte inferior por como la Toolbox
% maneja los offsets. 
% Por Juan Guajardo con Robotics Toolbox de Peter Corke, disponible en

% https://petercorke.com/toolboxes/robotics-toolbox/

% El primer link se define con las medidas que estaremos proponiendo, asi
% como los offsets y el alpha inicial.
L1 = Link('d', 28 ,'a', 15,'alpha', pi*3/2, 'offset', pi/2)

% La toolbox tiene muchas funciones Read para confirmar el estado de nuestros
% Links, este nos confirma con 1 True o 0 False si el Link es de revolucion.
L1.isrevolute;

% Esta funcion los regresa la matriz de transformación para cada Link de
% nuestro robot.
L1.A(0.2);

% Nuestro segundo Link sera uno prismatico, es decir con extencion lineal 
L2 = Link([ pi/2, 0, 0, pi/2, 1]);

% Se batallo mucho con este Link ya que no hay mucha documentacion que diga
% como definirlo, por ejemplo hay que limitar nuestro workspace con la
% siguiente funcion, seria la distancia minima y maxima del prismatico.
L2.qlim = [0.1 30];

% Nuestro tercer Link es otro de revolucion, le damos los mismos parametros
L3 = Link('d', 0 ,'a', 10,'alpha', 0, 'offset', pi/2)

% Para iniciar el manipilador unimos los Links y le podemos dar un nombre
% con las opciones de la funcion
bot = SerialLink([L1 L2 L3], 'name', 'Robot Arqui. ACT')

% Podemos mostrar la informacion de los Links con la siguiente funcion
bot.n;

%Para finalizar dibujamos nuestro robot, con los angulos y longitud de
%prismaticos que queramos.
bot.teach([0, 35, 0]);

