path(path, '.\ToolBox_Hemero')
path(path, '.\simpleMovs')
path(path, '.\simpleMovs\rotations')
%{
    Se quiere obtener la matriz de transformaci�n que representa al sistema 
    O�UVW obtenido a partir del sistema OXYZ mediante un giro de �ngulo �90� 
    alrededor del eje OX, de una traslaci�n de vector pxyz(5,5,10) y un giro 
    de 90� sobre el eje OZ.

    Nota: como el movimiento s� es con respecto a un sistema quieto(OXYZ),
    el movimiento se ejecuta de manera inversa: 
        rotaci�n en OZ(90) -> traslaci�n -> rotaci�n en OX(-90).
%}

% se define en orden las funciones
noventa = pi/2;
mNoventa = -pi/2;
init = [8; -4; 12; 1];

% ejecutamos el movimiento
giro1 = RotX(mNoventa);
r_uvw = transl(5,5,10);
giro2 = RotZ(noventa);

% la matriz homogenea que se usara para graficar la posici�n final 
% (girado y trasladado)
mHom = giro2 * r_uvw * giro1;

% empezamos a graficar, colocamos el sistema en TA (oxyz)
TA = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
r_uvw = r_uvw*TA;

% vector resultande, posici�n final del eje con respecto a OXYZ
vRultante = mHom * init;

figure;
% graficamos nuestro sistema de referencia en 0,0,0 color azul
frame(TA, 'b', 10)

% ahora graficamos ouvw
% primero la traslacion de color rojo
% frame(r_uvw, 'r', 5);

% ahora el eje final con rotaci�n y traslaci�n amarillo
frame(mHom, 'y', 5);

axis([-35 35 -1 35 -1 35])

% para poder girar el plano 3d
rotate3d
grid

