GDPC                                                                               <   res://.import/icon.png-803b86850699bf226e379a80bbfdbf3c.stex�;      �      &�y���ڞu;>��.p@   res://.import/weapon.png-d435c4876d83bbdd4b72ec04c2bc5610.stex  �      �      �V!��TkQ���%(�   res://player/player.tscn�            Vșx�!��T�䙃D   res://project.binary�Q      �      t���T
��9���h   res://scenes/arena_full.tscn�      �      �(O���	��n�١�   res://scenes/arena_left.tscn�      �       ���\����-u�H�    res://scenes/arena_right.tscn   �            r�b��1-����+�l   res://scenes/weapon.tscn�      �      �-�<z�\6��Rp    res://scripts/player.gd.remap   `D      )       �'���u�4�SX�   res://scripts/player.gdc�      S      ��>��D��@��Ƿf    res://scripts/weapon.gd.remap   �D      )       ��y���qGlAt����   res://scripts/weapon.gdc�      �       ��<���O,����*$   res://util/assets/weapon.png.import `8      �      �����;��/��    res://util/envs/default_env.tres ;      �       um�`�N��<*ỳ�8   res://util/textures/icon.png�D      �      G1?��z�c��vN��$   res://util/textures/icon.png.import �A      �      Ȁ(%�Sm�;g�_ ��            [gd_scene load_steps=4 format=2]

[ext_resource path="res://scripts/player.gd" type="Script" id=1]
[ext_resource path="res://util/textures/icon.png" type="Texture" id=2]

[sub_resource type="CircleShape2D" id=1]
radius = 137.033

[node name="player" type="Node2D"]
scale = Vector2( 1.03078, 1 )

[node name="rb" type="KinematicBody2D" parent="."]
script = ExtResource( 1 )

[node name="Icon" type="Sprite" parent="rb"]
position = Vector2( 2, -0.999996 )
scale = Vector2( 1.17674, 1.1016 )
texture = ExtResource( 2 )

[node name="Area2D" type="Area2D" parent="rb"]

[node name="CollisionShape2D" type="CollisionShape2D" parent="rb/Area2D"]
position = Vector2( 0, 4 )
shape = SubResource( 1 )

[connection signal="area_entered" from="rb/Area2D" to="rb" method="_on_Area2D_area_entered"]
               [gd_scene load_steps=5 format=2]

[ext_resource path="res://scenes/arena_right.tscn" type="PackedScene" id=1]
[ext_resource path="res://scenes/arena_left.tscn" type="PackedScene" id=2]
[ext_resource path="res://player/player.tscn" type="PackedScene" id=3]
[ext_resource path="res://scenes/weapon.tscn" type="PackedScene" id=4]

[node name="arena_full" type="Node2D"]

[node name="arena_left" parent="." instance=ExtResource( 2 )]

[node name="arena_right" parent="." instance=ExtResource( 1 )]

[node name="central_wall" type="Polygon2D" parent="."]
position = Vector2( 910, 0 )
color = Color( 1, 0.819608, 0.4, 1 )
polygon = PoolVector2Array( 0, 1080, 100, 1080, 100, 0, 0, 0 )

[node name="Camera2D" type="Camera2D" parent="."]
position = Vector2( 960, 540 )
current = true

[node name="player_left" parent="." instance=ExtResource( 3 )]
position = Vector2( 233, 569 )
__meta__ = {
"_edit_group_": true
}

[node name="rb" parent="player_left" index="0"]
move_left_input = "wasd_left"
move_right_input = "wasd_right"
move_up_input = "wasd_up"
move_down_input = "wasd_down"

[node name="player_right" parent="." instance=ExtResource( 3 )]
position = Vector2( 1741, 478 )
__meta__ = {
"_edit_group_": true
}

[node name="rb" parent="player_right" index="0"]
move_left_input = "ui_left"
move_right_input = "ui_right"
move_up_input = "ui_up"
move_down_input = "ui_down"

[node name="weapon" parent="." instance=ExtResource( 4 )]
position = Vector2( 593, 556 )

[editable path="player_left"]
[editable path="player_right"]
 [gd_scene format=2]

[node name="arena_left" type="Node2D"]

[node name="background" type="Polygon2D" parent="."]
color = Color( 0.937255, 0.278431, 0.435294, 1 )
polygon = PoolVector2Array( 0, 1080, 960, 1080, 960, 0, 0, 0 )
              [gd_scene format=2]

[node name="arena_right" type="Node2D"]

[node name="background" type="Polygon2D" parent="."]
position = Vector2( 960, 0 )
color = Color( 0.0235294, 0.839216, 0.627451, 1 )
polygon = PoolVector2Array( 0, 1080, 960, 1080, 960, 0, 0, 0 )
               [gd_scene load_steps=3 format=2]

[ext_resource path="res://util/assets/weapon.png" type="Texture" id=1]

[sub_resource type="CapsuleShape2D" id=1]
radius = 25.0
height = 132.0

[node name="Area2D" type="Area2D"]
rotation = -0.698132

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
rotation = 1.5708
shape = SubResource( 1 )

[node name="Weapon" type="Sprite" parent="."]
position = Vector2( 10, 4 )
texture = ExtResource( 1 )
  GDSC   "      .   �      ������������τ�   �����������������ض�   �������϶���   ����Ҷ��   ��������������¶   ���������������¶���   ������������¶��   ��������������¶   ���������ڶ�   �������Ӷ���   ���¶���   �������Ӷ���   �����϶�   ���������������Ŷ���   ����׶��   ��������¶��   �������������Ӷ�   ������¶   ������������������������ض��   ����¶��   ����������������Ҷ��   ζ��   ϶��   �������ׄ�������������Ҷ   ���׶���   �������Ӷ���   ������������Ҷ��   �������¶���   ���Ӷ���   ��������Ҷ��   �������Ҷ���   �����������Ҷ���   ��������Ҷ��   ��������������ض     �C   
   arena_full              weapon        reparent                                                        "      (   	   .   
   4      5      D      E      F      L      Q      R      Y      ]      f      m      n      t      z      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,   �   -   �   .   3YY;�  V�  PQY;�  V�  PQY8;�  V�  YY8;�  V�  Y8;�  V�  Y8;�  V�  Y8;�  V�  YY5;�  �	  PQT�
  T�  P�  QYYY0�  PQV�  �?  P�  QYY0�  P�  QV�  �  PQ�  �  �  P�  �  Q�  �  P�  PQQYY0�  PQV�  �  �  PQ�  &�  T�  P�  QV�  �  T�  �  �  &�  T�  P�  QV�  �  T�  �  �  &�  T�  P�  QV�  �  T�  �  �  &�  T�  P�  QV�  �  T�  �  �  YY0�  P�  QV�  &�  P�  QV�  .�  �  P�  R�  Q�  Y0�  P�  QV�  �  T�  P�  QT�  �  �  �  T�  P�  Q�  �   P�  Q�  �  T�!  �!  YY`             GDSC                  ���ӄ�   �������ׄ�������������Ҷ   ���׶���      arma: colidiu                                        3YYY0�  P�  QV�  �?  PQY`              GDST�   �            �  WEBPRIFF�  WEBPVP8L�  /��1͘i�Fɛ�A��rTm�*ύ��m���m��m�h�Y���3��8  �����7����gOU#��h���d����ڶm۶mۚ���w���iU�9}���3�����b����$I����ddeVf۶m���7Ҷ=SFwf%#_||�ˣm�n���V��h:{����tr�q�Jmۢ���{��?HE,E������Hr��i����������~��9a|T��P  ?��s[���U�CB�Q �_?A��{��'? H5v�>�X6�A��qّ5�a
� �)��-6����Y�8!|��prQbU�PX	U
1!CV O ��x�uo�� �`]�
@L  �B����� ��B���[њr�ߴ �
�}>�y�&�;b}���) )(   �.�D�<��X( h��<Ƞ
�(�e�[y^�B_���!E"���zd~י-� �h����#�Z���"��1�b]��ai1~�ft��s{D   �
=@�1L�^  pKX�4�S�)�$KV�W�/��hlE*��� X�rg�����嵠����P��PR � �]�"�D*1Q�xQ\����tJ  `%��sZ���T�ꪶ���xE1�`8���@�C�}�P0��5�Ӑ�Mn3�+��`���w���������lC\��V���<�
r\qO8��=�9���@S�,@
-%�)ы	��E���8�=v/� �� L �
  ��pwkR����KҨ �.�� N@L���i W8A-���8�U ޅ�ȦHHB���9���bEB������J�`��[�����&�)��*0k4�mľ	�:i>�'͂s����1�RBh��pb(�.�6�z�5��%L�e_�� ��A
��-x
��*4A
)�p
x!a<�8��  �B (���*Le���"�8P!B���BC�'�>���շ?��.��Q�x����a����?�oGx��h���0��V�}���m���RS͜�,:�M����b4V!�$�Ѕ(�L�B���� l
��v����.DNp3F�) pqb��^5%^����z��8* �)%^�>�x�/͋B�r8 �!	
�B
�z����)x�
�*���^��i�)�p@  W �{"�4 E�����@L���r#���8ȣ&z�^�J-G��D�m���Ř�׎�=	�Ҹ#�=-�o7�V�0�P  |W-Rb���h�qe�D��VX�O���*@sT�R��(R��X���?(��x���g��W�P���� �����8�#Q��������b�'��	�s�w�6yIl�	�P�ja�U� Ԑ���$DB�b"R��Bư�%�	
TH��s�pJ��-���A)��	CIT���ð�� 
R
o%6�� ��.����W?��"O�����:^n�'#�  /�����|Ek6y��Au1g��ۍhCu����>�,eDH�x��]�	 �[ (��d/�-
�J �<e���(J��ſJ�?8 �6�����1Y"�+d��C�H4%[� x��j�+�� � �� ȅ�A��pgqkx3a�̈́T���� �++E�"lp���My}�G�8�8J-�34U} ��h��S5��_   ˾��'��d�쏾� H\!'ܝ�?���{D��+����&�\�R�ZV��R����" �eᔷ�aʎ�uP�|��J$#��]��������
*���7���%nz_Ć����>;�O�Ϣ/9�o���
	nP�U<�*�a)a!Ui-V�o ��O.�  {+�C��#WY(EL�����p�)��b5��8�Á ����6ξ˜4�� v:o�a=��t]5ˏ93�@]6���d���&v]7G��{#�̞5@l������R��7� )ހP�"�ڍ�"B!�F��U c�B���6n
�1�2Ɗ�">�)XJ����� @����ľ��6���j˳I�
`�����t�}�Ξ�7��cV�P�V ^�Hê@���pL� A
!�[���*NB��@����
'��j����t��`�W%�Б
�lhh�@!��1�D������B�򦩿������F�R���\5΀;�޾̡X�Bg��&���]�6��Q7��Q��O�/4UI��2��)�P�Q�Bt��Op��"�"ë�)&�
���*�`�hE�"�B*�ֹ�a M ��������
XKp��w�gu���K_w�f�����u�'�bC�t�L ����^O��U�0r���[�^�s�lZt�u���n�ZQ�䄗BA1�pE���+s����?e	\�x9�M�DK�S��`�-�AH�R�� ��]KQ`w :lHU�$�Q)�.dE��fڻ�|�^b̙qw�'�yw��(Կ�ٝ� �I�2�i7f6�y��x�{��.~|��f�EV�|��*�}go�����MăU�^�+��$�d��v�%:��*�b����M8���
��t��F�"V������,�MD�(��BB	�
x���7'k O0�٩u,;y��n��w�� }Cf������E�Š����k_z���l��$��i�R��}��Vt�h]��U`�U.H�'��*Op�����R>,4 �7BCP�N|"dTUq��1�v RɎ� �PH^�	@�&�A�"�ax�;Y՞�~0�������rP�� ����B���o��V#�ߨ�Ɋ�Q|ܱz1ܞ����"^�Qt~匟ՌGO�bfMx�h��r���qs��JL� �H�X���&�r]���ݡ�UX�
�!E�x�{�g�]�.�#��V>ބ&����N"���a�鈴 �4z
�_��aP�*5��p��V���l�I�E���
��3O�p�差�fw����ћW����^��Ū�M�%Y!Ä�8 �lr"�B::�U b���
1�U�S� *��졼�H�� VQ���po��.)�K��&�*x� �%��h5�Ί�����ŉ5u�a�F6 ���:��ho�
�d+r�c��>��,���F��.��Ln+���O�U>LV�`�ȁ!,x1e7�!$�������*&A�r�^�o(8oh S�E��'6! ثx!T�w���M?s�w�n�� \���sv�غ���ٖ\�qf]�Eg�@b1�/7@�x�?�d�#��N_t�mb���7#�hEj1��}ۭ�}x��߄竡g@ݸ�G��Љ�m���@�Zawp�p�t�*���a�hv���V!��P�1�XJO�ۉn�*�� �b� o �-��@ � /E�٣�O��$5��˓���V����&:;Po?��ael5Sǡ�7��fɻ��rR�u�����l�Ց��1&��7L�U���E����q�e	*r/f�s��ґ���-��W}c��/U1m،͛�Uq&�n�v��H,F����V�&�u�8�����J�,'��9R�n���<sR�����I�:���a�#����K��|p�A9X8c�8���N����@ �ۈ� A��JX)
lD��'�D;.7V#�8��) `c:6C�XҰ��7��m9�+z�(lxՄRd��?��"��o��g�~%f/������+�X!������6 HkH�vB��,����#/'���b�<d�#�J��  �)*��	�.廧w���y�iy��ؼ	 �>���.n7�>�NG@j���B��f��$g]���7S������ѣ��;@z��n0���Mv�����gU�f���x-���-�q�v!+��s��.\�u�� �B�����V�U	�UP��#��	�@ Z��Ҋ�PH �����0]�HW�}0�>ް[���gSo��geh"W{k��t�;7����o_*ö������ �-�e�  ���|:��)�Eq�Ԭ�$~�t�ٷ"r0ӷ18�^�'���3B�W�֨�H��5R�Q��o&�5}�G/RFm�+�+��(9�%rr��4�'Wݻ��?S狑���^��
�q�o��_@'�HM����bd�c����Q����!' ,���R�BǼ�-������>j�� �($$���W��@)�HC��\�?�h��   P�{�q/��ݳ�WNv����cK��=P�ُ]��	������W����M�WPQ�R ��9�/
=��Z/RF�����,�ʨ��	�g�긜 ��7ʨ����Ķ3�{Q3�tj���7J;s�_ ��0���͇y~�\mf�n�˃����x�w1��mW��Er]ڗ)#� Ԝ2�j�4���P <ë�R5�$���F�X��UDC} `@Tq(� �WI'HŶj�D �%X @K k:���h�����]��W�� �
ó	��& �%����< +�C�^
��/bx: ����Z(�L�,�dݰ�Y��e��>{  ��s�pv��y������Q�v_,r�ێ4~��{�W����<��x@G?�������b�/j���y�-2����kRF�ˋ���G�o<X�������e�3�
��Ua�h� 2���   o�F�T�B�p�N�+A�Y�, k��G�ϟ�Y�X4�����g�w�+1d�}U���� �u� �@-RO���;��#���;{��e�2�jXo���3ݏOn�?��m����e�FM�Y����P�(N������ �{Dډՠ{�v�N_H#j�g��Nz9ɬ�A��#z���>����   �p����P1r��ڷ}3g}}z�}����Z%�-�kx���09%]e��	� �RDL-F�H�M�OA�) 
�@a�����!v� 
��^����;`�	��������X��Y%���Z�FO����:Z�epyQ5]����h3��$6��� 3,�Q����_��G�mT��2�{�t��Gcm���³���� ���G�����
H�%-� ���o�n��#grX� ��z`v/�=��y�ӧ�W�h&�N��dv�5U� @@FC�aUH)RW J��l(�
����Q ?��� �����e���wk]w��@�;�N��@�=�1Y5�7�3����t���O���|"�Kﳮj<r'�����^��I�?J/w�g�G;t��C�G����
�ֽ迸��;��d�g�����Qp�����  tyV��R��A�y#������k�ۏ,mzg'�]}7�f�;f��1@������-pQqs䀲&���|"�rU0���  <�ԟ� ��X���*��?��r� F�Ϥq�~����5^�N��������Šy�iٽ�W.�nb%�d��B�������*u��9:�LN2���^i��n� {אq��h��s����ÿ���/�x��s���� ����f��X��� ]�=Z+�[�o�� ��  |
���a�[N�`�-� U�& "<�8s�l0�
 �����Ｓ�08��_��Ix2R���P��}�x@��k8�#}��
 |�Y룛�d���w3{���	�j�n�I}w�7�^������ ly�Fa��p���^���?��,FZO�f%lw�~#N4�Ɋ�&�-����4��4PcÀ�	V �≄W!,P	$8��� [�Sl� ���C��00��/}P3ٱ��~�{�Ό��l$פ�d/�}�.�y��^ b�I�.y�r��@��T98��.|�S��A����W �\���h|�����  p���e�|�?X��Q��zt%o/F��i�����o�y��]�� �)b�X��NW�&ԂB(�)�p98�spU� `G��g��Uۃ���xF�A��&>:h}p`�q��r�n#���o3��L� ��nG�9;��7��y]���~�ŕ����	�~���p�O `������� X�l�o�l�F��	���}xyk���c   ! �\PeA�!�l����� a��� 6�v�V�n��:z�[��@j{�����e� ���'4��V��:���]��c7�
 ����_��ƪ0E>=���M���jG<@���mw�a5��E���g{��Ы'�w��y�6�u H�� � �B!*"�R � 6�� ��sҫ�q�Ǻ;q\�G�؍g�W��t�f#�8�F�����6d8��j����
 : »��V��w��   ��j��)����]�/:�v����W-g��zr�{�<�<!�@@ @A�P�G��\�� G�
  ���#y�6�QO7��_&wJMX����l�8�I�{���}�� �aW
 ��?�8������r5�n�ȼ���A|�������ޞm����+�Փ��,n���_���w��H�i(�	�bBY�E&0(���   �F��((1z���(��U�Iq��CWG�;6����������W X�Y �; p�Q���Ogk� 
+����4��$��r$��I�;��'  ��V�>(̖&�8����FV8!CB r၃!V ��S`�ê)��u�?X<�<��9Q��]�����* �Lo
 �g� ��WIQk�(L`� ��j��f���]j90/������
(�E��FE(% �1V!�W!r(f6&<�{V����>5#�364@�9k�R���g y�� ����T�2t�g��,�v{ =)��g�v'?^Y���~o�_�J,�����m�#�
�����@�j � �>���9/���M���@�M
 vW| �S��-�c������U#�w��]z5�2�eU�V�*Ċ�AV��lSR!��t,LQ�v�.$ ��7r >:�* h�� ���l�N%�[f�-Rw^q�D��f��	u��%�:y�t�s� ���qx�A�Aʡ�
�@) ���!�	V�W�ІvH ��@J �y� ����Ŭt�6�	}��{t�n'�m����l�e�&�����Ie�@ZEc����#�����- �1�S x�.ֱbn��q<36�3݈�/�ngD�٬���](�h5�lv5*r
�B��" T���/9L�!oͳ |��P֋���O���.�٢��Y�aG_|͗3~�d�f��)b�֑JH� ��\Ȋ
R�H��B�/ �`�p�� 샻߄��Y��}��!.w�7���h��+6{B�)  Ra �`Q Ba��D�¨�#h1_+K�����Ic ���v�g@�b�Ջ�� T�\)� �Ƣ��Sd���> R@:�न��W�:+r     �1����zT$������V�)� @�
��H	2��+\�5,�S(� K�"_`R`忕?�Z�wm �mw�J���?��a� QH�"��A���Uꐂ &l�2�څR��,M���UhE *�0R �<��B���&�����ɇϊ�u�~��zaiJ��+�b)�a!�2��C�ByE��O�2`�����B�   ���c ��
�!
,��T���@����ޔR ��"ۅyTtV 
"E�+"JN��� 	����3phE(�\�-�Q]�ՌV����W��P@PIV�ЬPhEZ
�`�R���We�*�����  x"��P�AC��bfG@ 0�.�x���'~��[B\q0@�$���^�R\CC�����b8��1��<�f�Iw-Ʒ���̊�E  ��/��: _���bȀ�c)��   �$.NL�� r4Y�9�)LY�y����yk�Z�� S�Q�I�. �(�c9^��=�����|ޚ�[S.�* �����߼��o����~��	             [remap]

importer="texture"
type="StreamTexture"
path="res://.import/weapon.png-d435c4876d83bbdd4b72ec04c2bc5610.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://util/assets/weapon.png"
dest_files=[ "res://.import/weapon.png-d435c4876d83bbdd4b72ec04c2bc5610.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
            [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             GDST@   @            �  WEBPRIFF�  WEBPVP8L�  /?����m��������_"�0@��^�"�v��s�}� �W��<f��Yn#I������wO���M`ҋ���N��m:�
��{-�4b7DԧQ��A �B�P��*B��v��
Q�-����^R�D���!(����T�B�*�*���%E["��M�\͆B�@�U$R�l)���{�B���@%P����g*Ųs�TP��a��dD
�6�9�UR�s����1ʲ�X�!�Ha�ߛ�$��N����i�a΁}c Rm��1��Q�c���fdB�5������J˚>>���s1��}����>����Y��?�TEDױ���s���\�T���4D����]ׯ�(aD��Ѓ!�a'\�G(��$+c$�|'�>����/B��c�v��_oH���9(l�fH������8��vV�m�^�|�m۶m�����q���k2�='���:_>��������á����-wӷU�x�˹�fa���������ӭ�M���SƷ7������|��v��v���m�d���ŝ,��L��Y��ݛ�X�\֣� ���{�#3���
�6������t`�
��t�4O��ǎ%����u[B�����O̲H��o߾��$���f���� �H��\��� �kߡ}�~$�f���N\�[�=�'��Nr:a���si����(9Lΰ���=����q-��W��LL%ɩ	��V����R)�=jM����d`�ԙHT�c���'ʦI��DD�R��C׶�&����|t Sw�|WV&�^��bt5WW,v�Ş�qf���+���Jf�t�s�-BG�t�"&�Ɗ����׵�Ջ�KL�2)gD� ���� NEƋ�R;k?.{L�$�y���{'��`��ٟ��i��{z�5��i������c���Z^�
h�+U�mC��b��J��uE�c�����h��}{�����i�'�9r�����ߨ򅿿��hR�Mt�Rb���C�DI��iZ�6i"�DN�3���J�zڷ#oL����Q �W��D@!'��;�� D*�K�J�%"�0�����pZԉO�A��b%�l�#��$A�W�A�*^i�$�%a��rvU5A�ɺ�'a<��&�DQ��r6ƈZC_B)�N�N(�����(z��y�&H�ض^��1Z4*,RQjԫ׶c����yq��4���?�R�����0�6f2Il9j��ZK�4���է�0؍è�ӈ�Uq�3�=[vQ�d$���±eϘA�����R�^��=%:�G�v��)�ǖ/��RcO���z .�ߺ��S&Q����o,X�`�����|��s�<3Z��lns'���vw���Y��>V����G�nuk:��5�U.�v��|����W���Z���4�@U3U�������|�r�?;�
         [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-803b86850699bf226e379a80bbfdbf3c.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://util/textures/icon.png"
dest_files=[ "res://.import/icon.png-803b86850699bf226e379a80bbfdbf3c.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
[remap]

path="res://scripts/player.gdc"
       [remap]

path="res://scripts/weapon.gdc"
       �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx��ytTU��?�ի%���@ȞY1JZ �iA�i�[P��e��c;�.`Ow+4�>�(}z�EF�Dm�:�h��IHHB�BR!{%�Zߛ?��	U�T�
���:��]~�������-�	Ì�{q*�h$e-
�)��'�d�b(��.�B�6��J�ĩ=;���Cv�j��E~Z��+��CQ�AA�����;�.�	�^P	���ARkUjQ�b�,#;�8�6��P~,� �0�h%*QzE� �"��T��
�=1p:lX�Pd�Y���(:g����kZx ��A���띊3G�Di� !�6����A҆ @�$JkD�$��/�nYE��< Q���<]V�5O!���>2<��f��8�I��8��f:a�|+�/�l9�DEp�-�t]9)C�o��M~�k��tw�r������w��|r�Ξ�	�S�)^� ��c�eg$�vE17ϟ�(�|���Ѧ*����
����^���uD�̴D����h�����R��O�bv�Y����j^�SN֝
������PP���������Y>����&�P��.3+�$��ݷ�����{n����_5c�99�fbסF&�k�mv���bN�T���F���A�9�
(.�'*"��[��c�{ԛmNު8���3�~V� az
�沵�f�sD��&+[���ke3o>r��������T�]����* ���f�~nX�Ȉ���w+�G���F�,U�� D�Դ0赍�!�B�q�c�(
ܱ��f�yT�:��1�� +����C|��-�T��D�M��\|�K�j��<yJ, ����n��1.FZ�d$I0݀8]��Jn_� ���j~����ցV���������1@M�)`F�BM����^x�>
����`��I�˿��wΛ	����W[�����v��E�����u��~��{R�(����3���������y����C��!��nHe�T�Z�����K�P`ǁF´�nH啝���=>id,�>�GW-糓F������m<P8�{o[D����w�Q��=N}�!+�����-�<{[���������w�u�L�����4�����Uc�s��F�륟��c�g�u�s��N��lu���}ן($D��ת8m�Q�V	l�;��(��ڌ���k�
s\��JDIͦOzp��مh����T���IDI���W�Iǧ�X���g��O��a�\:���>����g���%|����i)	�v��]u.�^�:Gk��i)	>��T@k{'	=�������@a�$zZ�;}�󩀒��T�6�Xq&1aWO�,&L�cřT�4P���g[�
p�2��~;� ��Ҭ�29�xri� ��?��)��_��@s[��^�ܴhnɝ4&'
��NanZ4��^Js[ǘ��2���x?Oܷ�$��3�$r����Q��1@�����~��Y�Qܑ�Hjl(}�v�4vSr�iT�1���f������(���A�ᥕ�$� X,�3'�0s����×ƺk~2~'�[�ё�&F�8{2O�y�n�-`^/FPB�?.�N�AO]]�� �n]β[�SR�kN%;>�k��5������]8������=p����Ցh������`}�
�J�8-��ʺ����� �fl˫[8�?E9q�2&������p��<�r�8x� [^݂��2�X��z�V+7N����V@j�A����hl��/+/'5�3�?;9
�(�Ef'Gyҍ���̣�h4RSS� ����������j�Z��jI��x��dE-y�a�X�/�����:��� +k�� �"˖/���+`��],[��UVV4u��P �˻�AA`��)*ZB\\��9lܸ�]{N��礑]6�Hnnqqq-a��Qxy�7�`=8A�Sm&�Q�����u�0hsPz����yJt�[�>�/ޫ�il�����.��ǳ���9��
_
��<s���wT�S������;F����-{k�����T�Z^���z�!t�۰؝^�^*���؝c
���;��7]h^
��PA��+@��gA*+�K��ˌ�)S�1��(Ե��ǯ�h����õ�M�`��p�cC�T")�z�j�w��V��@��D��N�^M\����m�zY��C�Ҙ�I����N�Ϭ��{�9�)����o���C���h�����ʆ.��׏(�ҫ���@�Tf%yZt���wg�4s�]f�q뗣�ǆi�l�⵲3t��I���O��v;Z�g��l��l��kAJѩU^wj�(��������{���)�9�T���KrE�V!�D���aw���x[�I��tZ�0Y �%E�͹���n�G�P�"5FӨ��M�K�!>R���$�.x����h=gϝ�K&@-F��=}�=�����5���s �CFwa���8��u?_����D#���x:R!5&��_�]���*�O��;�)Ȉ�@�g�����ou�Q�v���J�G�6�P�������7��-���	պ^#�C�S��[]3��1���IY��.Ȉ!6\K�:��?9�Ev��S]�l;��?/� ��5�p�X��f�1�;5�S�ye��Ƅ���,Da�>�� O.�AJL(���pL�C5ij޿hBƾ���ڎ�)s��9$D�p���I��e�,ə�+;?�t��v�p�-��&����	V���x���yuo-G&8->�xt�t������Rv��Y�4ZnT�4P]�HA�4�a�T�ǅ1`u\�,���hZ����S������o翿���{�릨ZRq��Y��fat�[����[z9��4�U�V��Anb$Kg������]������8�M0(WeU�H�\n_��¹�C�F�F�}����8d�N��.��]���u�,%Z�F-���E�'����q�L�\������=H�W'�L{�BP0Z���Y�̞���DE��I�N7���c��S���7�Xm�/`�	�+`����X_��KI��^��F\�aD�����~�+M����ㅤ��	SY��/�.�`���:�9Q�c �38K�j�0Y�D�8����W;ܲ�pTt��6P,� Nǵ��Æ�:(���&�N�/ X��i%�?�_P	�n�F�.^�G�E���鬫>?���"@v�2���A~�aԹ_[P, n��N������_rƢ��    IEND�B`�       ECFG      application/config/name          godot-wild-jam-game-53     application/run/main_scene$         res://scenes/arena_full.tscn    application/boot_splash/bg_color      q�>q�>q�>  �?   application/config/icon$         res://util/textures/icon.png   display/window/size/width      �     display/window/size/height      8     display/window/size/resizable             display/window/stretch/mode         2d  +   gui/common/drop_mouse_on_gui_input_disabled            input/wasd_up�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   W      physical_scancode             unicode           echo          script         input/wasd_down�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   S      physical_scancode             unicode           echo          script         input/wasd_left�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   A      physical_scancode             unicode           echo          script         input/wasd_right�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   D      physical_scancode             unicode           echo          script      )   physics/common/enable_pause_aware_picking         )   rendering/environment/default_environment(          res://util/envs/default_env.tres             