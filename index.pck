GDPC                                                                            )   <   res://.import/Coin.png-8174b8d78ea9c13f137d9a346c8b9e80.stex�F      ��      G�5�s�&j`5<   res://.import/icon.png-803b86850699bf226e379a80bbfdbf3c.stex�!     �      &�y���ڞu;>��.p@   res://.import/weapon.png-28240e62734a0f9c068754a4abac99f9.stex   *     �      �V!��TkQ���%(�D   res://.import/white_pixel.png-53a3cef7a4ea877f475dba38bc246c83.stex �L     F       h�O��,{'��d�M   res://arenas/arena_full.tscn�      L      /-+�h�������{.-   res://arenas/arena_left.tscn0      U      �r*�ڜA��R�m,]    res://arenas/arena_right.tscn   �      P      %-jnUx��͢#_դ[    res://arenas/middle_wall.tscn   �      ]      9�g1�_�[���g�?�^   res://arenas/side_wall.tscn @       �      p*r����~�A�x�)�0   res://player/left_player_input_definition.tres  0"      J      �x�=�S��^���Kp   res://player/player.tscn�#      P      ./	�&���`�;<�0   res://player/right_player_input_definition.tres �)      P      ��Z��,��8�&.��/   res://project.binaryp_     �      F�\dA�=g�:����d�$   res://scripts/arena_full.gd.remap   �O     -       !i��<����j�����   res://scripts/arena_full.gdc +      f      hj���_��Eϫ]4   res://scripts/periods/card_selection_state.gd.remap �O     ?       �Z��)4�Wt��a0   res://scripts/periods/card_selection_state.gdc  �/            n�}�0�,-p���m��,   res://scripts/periods/fight_time.gd.remap   0P     5       /X�ů>BP�O�|S$   res://scripts/periods/fight_time.gdc�4      �      ���z�o�e�,�*�E0   res://scripts/periods/period_manager.gd.remap   pP     9       � 0��<�� �P�i�8(   res://scripts/periods/period_manager.gdc�6      	      7�����7�O7�֝(   res://scripts/periods/prep_time.gd.remap�P     4       �]���=oiũ�'J걘$   res://scripts/periods/prep_time.gdc �7            s��W�>n��?�!48   res://scripts/periods/weapon_attachment_state.gd.remap  �P     B       I�0+�Sc�Fa�D�5�4   res://scripts/periods/weapon_attachment_state.gdc   �:      �      �H���`b_Ϻ�a:�,   res://scripts/player/fighting_state.gd.remap@Q     8       �T�X�s*#\X�Oc(   res://scripts/player/fighting_state.gdc P<      �       �}#L�:���x.w�o]�8   res://scripts/player/movement_input_definition.gd.remap �Q     C       ��z�|� .�J��X4   res://scripts/player/movement_input_definition.gdc  0=      C      �D����APb�վ� $   res://scripts/player/player.gd.remap�Q     0       �y��P	����Y�{�    res://scripts/player/player.gdc �>      �      �$Be�sNj����� �0   res://scripts/player/player_movement.gd.remap    R     9       �<53OdwMg�P�H�(   res://scripts/player/player_movement.gdcP@      �      c���s=2��ɐ��L4   res://scripts/player/player_state_machine.gd.remap  @R     >       \BE
�q'���b��?0   res://scripts/player/player_state_machine.gdc   0D            �~�{����Zܖ��    res://util/envs/default_env.tres@F      �       um�`�N��<*ỳ�8$   res://util/textures/Coin.png.import �     �      n��<��l��;���Y   res://util/textures/icon.png�R     �      G1?��z�c��vN��$   res://util/textures/icon.png.import p'     �      Ȁ(%�Sm�;g�_ ��(   res://util/textures/weapon.png.import   �I     �      �H<
���OTH�Bc��,   res://util/textures/white_pixel.png.import  �L     �      h���V�S������l            [gd_scene load_steps=12 format=2]

[ext_resource path="res://arenas/arena_left.tscn" type="PackedScene" id=1]
[ext_resource path="res://arenas/arena_right.tscn" type="PackedScene" id=2]
[ext_resource path="res://arenas/middle_wall.tscn" type="PackedScene" id=3]
[ext_resource path="res://arenas/side_wall.tscn" type="PackedScene" id=4]
[ext_resource path="res://player/player.tscn" type="PackedScene" id=5]
[ext_resource path="res://scripts/arena_full.gd" type="Script" id=6]
[ext_resource path="res://player/right_player_input_definition.tres" type="Resource" id=7]
[ext_resource path="res://player/left_player_input_definition.tres" type="Resource" id=8]
[ext_resource path="res://scripts/periods/period_manager.gd" type="Script" id=10]
[ext_resource path="res://scripts/periods/fight_time.gd" type="Script" id=11]
[ext_resource path="res://scripts/periods/prep_time.gd" type="Script" id=13]

[node name="arena_full" type="Node2D"]
script = ExtResource( 6 )
card_timer_path = NodePath("period_manager/prep_time/prep_timer")
weapon_attachment_timer_path = NodePath("")
player_scene = ExtResource( 5 )

[node name="period_manager" type="Node" parent="."]
script = ExtResource( 10 )

[node name="prep_time" type="Node" parent="period_manager"]
script = ExtResource( 13 )

[node name="prep_timer" type="Timer" parent="period_manager/prep_time"]
wait_time = 3.0
one_shot = true

[node name="fight_time" type="Node" parent="period_manager"]
script = ExtResource( 11 )

[node name="fight_timer" type="Timer" parent="period_manager/fight_time"]
one_shot = true

[node name="Camera2D" type="Camera2D" parent="."]
offset = Vector2( 960, 540 )
current = true

[node name="arenas" type="Node2D" parent="."]

[node name="arena_left" parent="arenas" instance=ExtResource( 1 )]

[node name="arena_right" parent="arenas" instance=ExtResource( 2 )]

[node name="walls" type="Node2D" parent="."]

[node name="side_wall_left" parent="walls" instance=ExtResource( 4 )]
modulate = Color( 0.164706, 0.176471, 0.203922, 1 )

[node name="side_wall_up" parent="walls" instance=ExtResource( 4 )]
modulate = Color( 0.164706, 0.176471, 0.203922, 1 )
position = Vector2( 1970, 7.27596e-12 )
rotation = 1.5708
scale = Vector2( 1, 1.871 )

[node name="side_wall_down" parent="walls" instance=ExtResource( 4 )]
modulate = Color( 0.164706, 0.176471, 0.203922, 1 )
position = Vector2( 1970, 1130 )
rotation = 1.5708
scale = Vector2( 1, 1.871 )

[node name="side_wall_right" parent="walls" instance=ExtResource( 4 )]
modulate = Color( 0.164706, 0.176471, 0.203922, 1 )
position = Vector2( 1970, 0 )

[node name="middle_wall" parent="walls" instance=ExtResource( 3 )]

[node name="players_spawn_positions" type="Node2D" parent="."]

[node name="Position2D" type="Position2D" parent="players_spawn_positions"]
position = Vector2( 100, 100 )

[node name="Position2D2" type="Position2D" parent="players_spawn_positions"]
position = Vector2( 1820, 100 )

[node name="players" type="Node2D" parent="."]

[node name="player_left" parent="players" instance=ExtResource( 5 )]
_movement_input_definition = ExtResource( 8 )

[node name="player_right" parent="players" instance=ExtResource( 5 )]
_movement_input_definition = ExtResource( 7 )

[node name="time_label" type="Label" parent="."]
margin_left = 794.0
margin_top = 24.0
margin_right = 1670.0
margin_bottom = 486.0
rect_scale = Vector2( 8.99015, 12.0935 )
text = "00:30"

[connection signal="timeout" from="period_manager/prep_time/prep_timer" to="period_manager/prep_time" method="_on_prep_timer_timeout"]
[connection signal="timeout" from="period_manager/fight_time/fight_timer" to="period_manager/fight_time" method="_on_fight_timer_timeout"]
    [gd_scene load_steps=2 format=2]

[ext_resource path="res://util/textures/white_pixel.png" type="Texture" id=1]

[node name="arena_left" type="Node2D"]

[node name="WhitePixel" type="Sprite" parent="."]
modulate = Color( 0.94902, 0.392157, 0.188235, 1 )
position = Vector2( 480, 540 )
scale = Vector2( 960, 1080 )
texture = ExtResource( 1 )
           [gd_scene load_steps=2 format=2]

[ext_resource path="res://util/textures/white_pixel.png" type="Texture" id=1]

[node name="arena_left" type="Node2D"]

[node name="WhitePixel" type="Sprite" parent="."]
modulate = Color( 0, 0.615686, 0.862745, 1 )
position = Vector2( 1440, 540 )
scale = Vector2( 960, 1080 )
texture = ExtResource( 1 )
[gd_scene load_steps=3 format=2]

[ext_resource path="res://util/textures/white_pixel.png" type="Texture" id=1]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 25, 540 )

[node name="middle_wall" type="Node2D"]

[node name="StaticBody2D" type="StaticBody2D" parent="."]

[node name="CollisionShape2D" type="CollisionShape2D" parent="StaticBody2D"]
position = Vector2( 960, 540 )
shape = SubResource( 1 )

[node name="Sprite" type="Sprite" parent="."]
modulate = Color( 0.164706, 0.176471, 0.203922, 1 )
position = Vector2( 960, 540 )
scale = Vector2( 50, 1080 )
texture = ExtResource( 1 )
   [gd_scene load_steps=3 format=2]

[ext_resource path="res://util/textures/white_pixel.png" type="Texture" id=1]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 25, 540 )

[node name="side_wall" type="StaticBody2D"]

[node name="WhitePixel" type="Sprite" parent="."]
position = Vector2( -25, 540 )
scale = Vector2( 50, 1080 )
texture = ExtResource( 1 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
position = Vector2( -26, 541 )
shape = SubResource( 1 )
     [gd_resource type="Resource" load_steps=2 format=2]

[ext_resource path="res://scripts/player/movement_input_definition.gd" type="Script" id=1]

[resource]
script = ExtResource( 1 )
left_input = "wasd_left"
right_input = "wasd_right"
up_input = "wasd_up"
down_input = "wasd_down"
interact = "wasd_interact"
cancel = "wasd_cancel"
      [gd_scene load_steps=10 format=2]

[ext_resource path="res://scripts/player/player.gd" type="Script" id=1]
[ext_resource path="res://util/textures/icon.png" type="Texture" id=2]
[ext_resource path="res://scripts/player/player_movement.gd" type="Script" id=3]
[ext_resource path="res://scripts/periods/weapon_attachment_state.gd" type="Script" id=4]
[ext_resource path="res://scripts/periods/card_selection_state.gd" type="Script" id=5]
[ext_resource path="res://scripts/player/fighting_state.gd" type="Script" id=6]
[ext_resource path="res://scripts/player/player_state_machine.gd" type="Script" id=7]

[sub_resource type="RectangleShape2D" id=2]
extents = Vector2( 32, 32 )

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 33, 33 )

[node name="player" type="Node2D"]
script = ExtResource( 1 )

[node name="player_body" type="KinematicBody2D" parent="."]
script = ExtResource( 3 )

[node name="Sprite" type="Sprite" parent="player_body"]
texture = ExtResource( 2 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="player_body"]
shape = SubResource( 2 )

[node name="player_hurtbox" type="Area2D" parent="."]

[node name="player_hurtbox_collider" type="CollisionShape2D" parent="player_hurtbox"]
shape = SubResource( 1 )

[node name="state_machine" type="Node" parent="."]
script = ExtResource( 7 )

[node name="card_selection_state" type="Node" parent="state_machine"]
script = ExtResource( 5 )

[node name="weapon_attachment_state" type="Node" parent="state_machine"]
script = ExtResource( 4 )

[node name="fighting_state" type="Node" parent="state_machine"]
script = ExtResource( 6 )
[gd_resource type="Resource" load_steps=2 format=2]

[ext_resource path="res://scripts/player/movement_input_definition.gd" type="Script" id=1]

[resource]
script = ExtResource( 1 )
left_input = "arrow_left"
right_input = "arrow_right"
up_input = "arrow_up"
down_input = "arrow_down"
interact = "arrow_interact"
cancel = "arrow_cancel"
GDSC            �      ���ӄ�   ����������������Ŷ��   ��������������������������޶   �����������޶���   ��������������޶    ���������������������������޶���   ��������������޶   �����������Ӷ���   ����������Ӷ   ���������������������ض�   �������Ӷ���   ������Ŷ   �������������Ķ�   ��������Ӷ��   �����϶�   ���������������������ض�   ����¶��   ߶��   ��������������¶   ��������Ҷ��   ��������������ض            players_spawn_positions       players    
   card_timer        weapon_attachment_timer    
   time_label        period_manager     	   prep_time                      	                  '      1      ;   	   <   
   =      >      D      E      N      W      `      k      l      r      v      |      }      �      �      �      3YY8;�  Y8;�  V�  P�  QY8;�  V�  P�  QY8;�  V�  P�  QY8;�  V�  P�  QY8;�  V�  P�  QYYYY8;�  V�  YY5;�	  �
  P�  QY5;�  �
  P�  QY5;�  �
  P�  QY5;�  �  T�
  P�  QYY0�  PQV�  �  PQ�  �  T�  PQYY0�  PQV�  )�  �  T�  PQV�  �  T�  P�  QT�  �	  T�  P�  QT�  Y`          GDSC         -   �      ���Ӷ���   ���������ڶ�   �������Ӷ���   ���¶���   ��������Ҷ��   �������������Ķ�   �������Ӷ���   ���������������ض���   �������Ӷ���   ����¶��   �����Ӷ�   ����϶��   �����������Ҷ���   �������������ض�   ����������������������Ӷ   ��������¶��   ����¶��   ���������������������Ҷ�   ����������¶   �������¶���   ���������¶�   ������¶   �����¶�   �����������Ҷ���   ����Ӷ��   �������Ҷ���   �����ض�   ���������Ӷ�             period_manager        Card selection begun                               #      $      *      /   	   0   
   1      7      9      :      ;      <      ?      B      E      H      N      Y      ]      h      l      w      {      |      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,   �   -   3YY5;�  �  PQT�  T�  PQY5;�  �  T�  P�  QY8;�  V�  YY0�	  PQV�  �?  P�  QYYY0�
  PQV�  -�  YYY;�  Y;�  Y;�  Y;�  Y0�  PQV�  &�  T�  P�  T�  QV�  �  PQ�  '�  T�  P�  T�  QV�  �  PQ�  '�  T�  P�  T�  QV�  �  PQ�  Y0�  PQV�  -YY0�  PQV�  -YY0�  PQV�  &�  �  T�  V�  �  PQ�  Y0�  PQV�  �  �  T�  �  �  T�  �  �  �  T�  PQ�  �  T�	  PQYYY`    GDSC   
         >      ���Ӷ���   ���������ڶ�   �������Ӷ���   ���¶���   ��������Ҷ��   �������������Ķ�   �������Ӷ���   ����¶��   ����������Ķ   ����������������������¶             period_manager        The fight has begun!      Fight time has ended.                                        $      +      0   	   1   
   7      <      3YY5;�  �  PQT�  T�  PQY5;�  �  T�  P�  QYY0�  PQV�  W�  T�  PQ�  �?  P�  QYY0�	  PQV�  �?  P�  QY` GDSC                   ���Ӷ���   ����Ӷ��   ����������������   ����������������ⶶ�   ����ⶶ�   ������������Ӷ��                         
                           	      
         3YY>�  N�  �  R�  �  R�  �  YOYY;�  V�  YY`       GDSC            l      ���Ӷ���   ���������Ӷ�   ���������¶�   �������Ӷ���   ���������ڶ�   �������Ӷ���   ���¶���   ��������Ҷ��   �������������Ķ�   ���������Ķ�   ����¶��   �������������������Ӷ���   ���������������������¶�   ���������������Ӷ���   
   fight_time               period_manager     
   prep_timer        Prep time has begun       Prep time has ended                                *      3      4      :   	   @   
   E      L      M      N      T      Y      ]      ^      d      j      3YY5;�  �  PQT�  PQY5;�  �  PQT�  T�  P�  QY5;�  �  T�  P�  QY5;�	  �  P�  QYY0�
  PQV�  �	  T�
  PQ�  �?  P�  Q�  W�  T�
  PQYYY0�  PQV�  �?  P�  Q�  �  PQYY0�  PQV�  �  T�
  PQY`           GDSC            2      ���Ӷ���   ���������ڶ�   �������Ӷ���   ���¶���   ��������Ҷ��   �������������Ķ�   �������Ӷ���   �����϶�             period_manager                                                    !   	   "   
   #      )      +      ,      -      .      /      0      3YY5;�  �  PQT�  T�  PQY5;�  �  T�  P�  QYYYYYYY0�  PQV�  -YYYYYY`GDSC                   ���Ӷ���   �����϶�                                                 	   	   
   
                                             3YYYYYYYYY0�  PQV�  -YYYYYY`         GDSC          
   ,      �������Ӷ���   ����������������������ض   ���������¶�   ����������¶   �������¶���   ���������¶�   �������¶���   �����ڶ�                                                 $   	   *   
   3Y2�  YY8;�  V�  Y8;�  V�  Y8;�  V�  Y8;�  V�  Y8;�  V�  Y8;�  V�  Y`             GDSC            ;      ���ӄ�   �����Ķ�   ����Ҷ��   �������������������������ض�   �������Ӷ���   ���������������޶���   ����������϶   �������������¶�   �������Ӷ���   �����϶�   ������������������Ŷ     �C      player_body                                                      	   +   
   ,      2      9      3Y2�  YY8;�  V�  Y8;�  V�  YY8;�  V�  P�  QYY5;�  V�  �  P�  QYY0�	  PQV�  �  T�
  P�  QY`  GDSC            �      ������������τ�   �������������¶�   ����Ҷ��   �������������������������ض�   �������Ӷ���   �������϶���   ���������������Ŷ���   ����׶��   �����������������¶�   �������������Ӷ�   ����¶��   ����������������Ҷ��   ����������¶   ζ��   ���������¶�   ���������¶�   ϶��   �������¶���   ������������������Ŷ   ������������������������ض��     �C                                                          	      
         "      &      '      0      1      7      =      H      N      Y      `      k      q      |      �      �      �      �      �      3Y2�  YY8;�  V�  YY8;�  V�  YYY;�  YY0�  P�  QV�  �  PQY�  �  �	  P�  �  QYY0�  PQV�  �  �  PQ�  &�
  T�  P�  T�  QV�  �  T�  �  �  &�
  T�  P�  T�  QV�  �  T�  �  �  &�
  T�  P�  T�  QV�  �  T�  �  �  &�
  T�  P�  T�  QV�  �  T�  �  YY0�  P�  QV�  �  �  �  Y`               GDSC             H      ���Ӷ���   ����������Ӷ   ����������������   ����������������ⶶ�   �������񶶶�   �����Ŷ�   �������������������Ӷ���   �������������Ӷ�   ������������Ӷ��   �������Ŷ���   ����׶��                         
                           	      
   !      )      0      2      3      <      =      D      F      3YY>�  N�  �  R�  �  R�  �  YOYY;�  V�  N�  �  T�  VW�  R�  �  T�  VW�  R�  �  T�  VW�  YOYY;�  V�  �  T�  YY0�	  P�
  QV�  -Y`[gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             GDST�              ��  WEBPRIFF��  WEBPVP8L��  /� F�(l۶��]����#"�?�d�Z 
 Ȼ��d�:�$�q�H�$%�k&�}��( lIR���3�3�t��H�]����`�p>���!}hFf�!�^��ͤskW]_�b��B��i�@�C��prQ�3P!��(Ѩ���:��"��G�"�2!��Qж����!"�8m��୓u�{�E�)��k۶�(}�S�	� r1��z�x�m[w�����e�A��ۯp�E�l�?�.s���?n=�I��Ha�����~{���7֎z�-J.GmD�YA�z'�<��޶Ͷm�hH�TO�����u�Ė�X@��ٶm�v#��ϹO
ff���lGDf� }@��3? k�Ufff1�ff����k�E|�oI�,I�lY�<"�.}��o�w^��Tķ$I�$۶�nn�YYU=za�����Y�4���@��m[i۶��Q,P������>�g�� ��ۊBBI�	�d۶jۑ������F�/38IƔ��"RQ�:E5��̙��r3�w��3���(�oI�,I�lY�#�23���'�Uط$I�$I��"bf�Y}�����u]��j�ެm[#I���L�>���)"2k1�[�׻{�lf��c�'3� O���v�V=��y�n۶�����ؽ�{z�q۶��=�u����$ɒ$ɶ�Uݣ��TQ}����w'Dz��
ےm[�$i�����HςH����fffF����_<ff�_��pI�iڶ=mm[zbK�%s`�����U-��/�_\=���s֜3�H�mIv&��m۪�Hk����Ͷ(����PN�g7�J�"�����"��L��{vr�䯺oI�,I�l��E�,�Uݟ��?|w�0S�(I�#I�m�p��`���E�w�ʌf�l�V8�K������Уd�6s�b�-2H� o۶-�Zk�Ķ�8���x�k��m�c�����6���:����}�h�q'�"�T]��:t5��$ɒ$ɶ�YT�#/}����u�Uuwd����'m{9�m�`�=$�dΥ��Ū���VX�Ւ�3gr�2"��̀� L�m���h�s�����dfKf�kY�&d�:�Ef�>dĒ���+���w�ޅ�c|�e|K�dI�d[Ȣ�5���Ӻd��0I�I�$����]�=3c|���twUf���� /)����P08�]�\��#]����
���"@�
GT8c�J<�c@�W�S|kh�B��`�9�����c�o����)z�G���	��r�IB�� Ӽ �	5:�0�A��G� �������	- �8a�f�?�C�#Z��4h0a�^U�
3f��r�^0c�U�0���a�h �̑��Q���x���د���P�TX�{	�J
 � @m�>��1C�^�Ε�����s@F0@, %`@�3~�1��=v(��)��!���b�	~���  ���O��7L��rtX%	*\1`@�>l�o�p�zT8��5�����tx�-&�C�K�XaD������n��Jh0c�
(p�!ǄpR7X�` ^�  T
��� �d�h���5 � �+LQa�)� *�\�Wt�sƃ@���<�~�A������	
thp�-"L��G<��JTxb�K�x�%Ft(�@�P�GX��^��*�X�����$Y�%r\�4Pn�1�@�? o���+~`�3��P��0*Th��k\1�B�8c�G���
J�X�qC�"�
X�C`� P���F	*TE%#��nO8��#�@�(Ł� X  �f��vC��ib	(%B-p��7 8�	@�� ���9樑���b\���#�{@��W,Q�Ār@������#`�	r�ѣH�A����i��[�8�;��	[L H�����Ax  ��H8a�+j�#�8�@�r,0�\�c@�Q"b�p�fh����� @��^
˂RK%
 [ḗ/D��t�٘�� ��8  �	�W���?��
D��{���p� 5�#^0G�R���1����@�3@�;`�)^ ���H0`�J�0��j|B � �=v�#F@��5f� 	3v8a��X���=��g���:��#J��E�����ƈ�8�7���
;|a%�`���W48�"�(d���=v	k��,�
��8�k��c�#�P��1H�0�) ��t�t��B�QV9ێ^�a 8ax�+F�  ÈGtV�#&��5�o�P!A�%�(�`@���0���C��
�'� b�H�G��ȱt�`BD���� ��
3j� P�.h�"�
d(Pb�%r�"C�3*�8 z�آE��<���@A!��@+��P1js�1��]���S���,�p�E ����Ji�H& ��G	�5Z< ���
Dhq�3���&آ�g4�0��7dH0E�kD(pF�p�:t�㌀#RD�pEhP%	w�1`��x�� P 2@��ָ`�#fl��W��n8b�����/��p�-ة��Glq�3�b@�+T�1�
�T(a� $,jxDd �5�%�2�dK�6����q�1"�ZX�W  ��x��E���H0��ʸL��V|�`���8!��`�%0�r���	��A@�0��$�jk�_�`�bܰ��B��$����m��ՉS��:ǩ��n�t�� ��<�ة�y�C� ��R+�P� ͌����!�
� kP&TȰB���;n�pE+f�"�Ä���':�@�
D(HX  $%`�*��k�h������.rF��6� ���Wt�S{������@A�2@@�ƌ	�� 8a��b.��>� Zq�D+���ǀ�pǮ��Ԯ��5u����RScM�Ԕ&j\9^���s�d3�-������K��cӆUϒ9���(��j3�zx��i���l��vy�����g9���� �ӜI�c�&�A��<�|4V�[S�B.��+���
k��ꂮ3�ܪ��J��&�Dۙ����9u:�vD�"�E�Ԣwq'�CL��Z�[\�ŀ��b@��(qDD� �PQrcfY,�hI����|�w��%���=/y��p�Ǻ�cm�X[.x��O�#�5��.w�3PPP@ �A� X� ^�J��_Q��X#ƀ>b�%ZH��À+(�@�� ��5�x֔�T�dsN-�F�$+b��f@�ִ"�N#)��.⚤:���C�\J�a�����p�����/��wr�>�<�ڧ>���,�^�����{[7?������k{t�3��/�����!wM�5��V�8��Z�\��*�'҅{��F\:Y�2����aB�n��%�5�x�O�jD�'�x��O�F�p��7VD�(	`��u�c#T��e��=���s��r��{�_�7�_�g����P0 %zHLX����3&,��
9��c�'<p�9�P �n��F��Ϥ�I��(�yҏI�%��:�V��2$������L�$�s�i񶓃�������K㞜�mq9}�����Y{���٧�O3?��W��n�k�?������G�{����7v/���%ip�����G��K�z2\w��?t�/�ܿv��mO��nG�~&���|��r���8Me3%�O�n��~*���z �6�-��5Jd���+x�g4(��/Dd�b@�5V|���B�-�!qFO�h�h�ط���u ����UhX�@�**T�2h��K�8  �����< �� %j�P��;��C
K#A�ր
,pD���P�X�X'}U[y�K���93g���t�L�O���͙�ss~p��dr���)�T:pN`C2���òe��2��!
@4HlhT��[-B?Ø��+���7������O�|a�9���?%2/��!���Im���2x�#��b��+��E�
�СWwdؠÄ�	����O<1 Pb��ho�f�0X �aI� �3=]z�������X��O�ܟ�8�>����o����5�(q�O�(q*,14�)@���Io�.�k�'^;]iE�'eʒ��jymI���=��d�[6����=j�*S�S�����R��]�I!=�fr�)I����TW{������H)Ne]�4����v�FkN fI���S������?������c���~�_�-_je�;e٩ԩ�Sm�t�9�-p���'��K"`%֨ *(� ��1`A��ȥh{\p�{�u���_K�yH���;&z���+iL�ZX���ZX ��ǀ�ђl4����0(Tx�J�� (�h1����n������УE�-���@xO��@d�ea(=��;C'��5o�gf�����3>�o��=�_�yr���=�	���PթR�`j� j  B�j@TXF���	�%�ü�  ���1��y�헯��o�����h�?���f�w�;B\Ӹ��*5%�z<w����`�	ZT(�#Sg�Ȑc�
���O��D�Px|N�s ��~��;h�PEB9���uO�s���7��X�BB�
� u���s�S�$�l��xh�����'$�ႀsl�# ��SLQ`���^k�Z[im=S����>�� }���������p��\�����o��͇s��t}R'�)�N����PZcOp�$�D��5abv��yx��R\�=c�f�ண��r��Β>=��x�t_ټ��ݷ��;��y�g*��2j=ZDq�W�P���`P	\��Xa����:|��'��O��� �e22j$�DW���s<�\cL �*((��_ H4�粧c�m�H	�		�DF�
o��=��3^HP @�У�|F�#>c�Im�Sc&�"�������n��{�|��g��ɝ��^f�yg2�0�	b(�4�8%��� H'�@mH'Yl�����,�,��g�}��) [oO�~�\� �O��f@����X9mo)����l�ǋ��?f�˕y}�v�Dߜr��ͼ��e�R��W,��+�P"a�;)�&�p�F��� �f�P�/̰(Q�~@�q�,x �I�|�	����@%�Rc�1��� `�W�����/ oq�q�y���H�d�!�!P�P�	��-�Z@��+�0��JTءNz��S_��,�~Nzac����g�q���Q��%�.���.������_��/�_����Ù���՚e2�+����Fҳ\<��;9��}r�e����2Co�$���]-E��*��+?�)���<�/_짟��>啫y��Q���|9R���#�;�i�����_����?hѡ��N�o�S��`͑��|z����;��o�����^���&^_6�}�L2��M�s��H���hA�fLs��RwQ�Z�8���!
Q@������c���qI.IH�Xq����?�*	�q@;d�.ְ8P ���e!f����R"	$�H��-� *��+�p��A��|E��>!A�P[k�u@�Jm��V�hsHz������N_NO�ya��_�����D��z}��_Wk�ɸN�i$d��O/�/ȟ�R���o����ٶev�=-v���=<.t�s2�3��6��.�^]]��������2�����r���6S������\�<��p���=����x�8��;�ݷ�g���x'A#�{\V.���Yݼ��4��K�����H���|�v�Xsܓ
y�i%F��%���̆>b�N�РE�w(��7X�B#T�E8bĿ������QC@ �h��l�b����+,���~I�=��"
	 DX� H,H�h�<����{��`����wLТA���v��������T{�k����DIL29�3����	�/�������_�����>i���ǿʸ��{�r�g��������#��3�9�e��Uu��o�aTsO����Műl����}�� ��yj������VV-�#e�C�=%mh��f{'o}�~��~�_����_���ZwR�����pc&���W2//ݑ��r���z��%���i�S�.�ߌ���{�R`�	7��;.8������G�h1@b����-,"4dhxXH���A��#u]��iaQ��\Z�KO�^6� �(1��x�;> n8�	`�)~	7@�������I�QstuGW��53��ִg'ݬ��ay���J�����svC�[�÷��=�Wx�ޭ�Y�Mǆ>+��X�&�y��}9�W��]=$�v�i��R]P��v�F#��ղ���6X��eX�M)��n-�.�Úo��b����髆��˞�?ŗ4v-y���;f�RS_g��{�����F�Μen�]Y?C̨p�`8a���
�� "��(  <@�fXP��b�=74�ů ���Q @c %� ��#<"��$�3R���6�!A�<q��UM����u�|=g^�99�3_�Z<��#=��]������_n�������Ə.�}���|��3�ٜ&N���lF����<��^��~�<��C�a풫�i�&�D  �+@� @3���o���Ý�}����#��o����3��m�>���I�F���������z�=?_�>��#U�����O�p��Q��-"��A�
�_�)�O �		�xT f�,���辣�%ڄ*��'X{l��#ڌ��#VTHx`D�	_�P��	34�F@�J��@�J,��Xt����w���ۼv�K���{v�y����l�����:$͓?���穾�1��v~���}�?����ɬ��ݮvO��A��'�|.�~Z�C�R�P[,c�+���.�R�$ r � @� hD��BD�����O��1��Eo��vCɞ�v:���r��]c��g�����}�uΙ�����Ǻ�K� [8� @�A �7���Pb�� 	-4,V\pA�f ��(�V4��B�yC�G�_Y ���y>o7����%
DD|��
O� j܅�P(0����=�x�g���'keMq�w�p��}y�u��ܲ/�߫>���_�۹��vO�K�nwL/��Ի{JfO�.�C����㻹�g�����'��̯a��8�LW5�|w�����tC�;��Aa(�	�1'{Ju锚$Ip Ҁ߷9  �؀4�ٚ-�I�g�˘/O�w�tM�}��ߒ?c���n��n�#�#�_���w9Oę��|dw�9dx �1�Ɗ#2P!����p(0�	�WL��Xp�A�<<%zY[��C>��vI  �3͑���׹~����|��[�7� �� �P���p����+ j�xC�F����u�6�cm�+Ӻ3���7���������u�;�������w/����*�uOk�}������o�g�N�f�fW�G3��e|���%��*�:���O�T��>AmI'B�����]� ��֔�L[X��Ok����7��7~y������X����~��_Y���I���}�����UFF�pC�#6h�` ����� ����;.P�����P� � 2�F/= ��2  ��2��@��y��:���J  c�D�$>1
G܄3&t�ZL��`�w�U[3��J���q$�U6f�8�]v�y���䯎y��L:�ݤ�Џ�+�|���������}��k����W�������k�۬��ڬ������f=_�zU�+��"%�t�:  ���   e�mܖ�jl�7Ӷ9��Ly��W�nyش�p����}���/9�6�}��<�97�K���ie$��; pB@��
/���- (�	G!�G�� XK�F�J�*����/x��c]��=��۶���y� ��:zD��{� ��1�E�P? f|�4@@��=.�pCJ��:��8����efҾNv�a5&���G�w�1,��-��X�a�{7y^��S~�x��f�x2'�z���c�}�t�c3�7��e���:�J�Npe�W�����o�� Q,�-�	#�wߞ��WSrcM�/��px.?=������cf�k����%Hw�'.(� � O��� {T�0 �	=@���08c�=�� �Z  �  U�GTh��|������D�;$��7<��O�P�
�	6(d��@�:�p{�'ۤ�,J�����6�˰]�'��ZZ�:���A�vI�1|�_��������������������������o��?/j.z.�n�[-_o�x<�з���åZ�Z��vcK:%3�' Hu P3��;���w�wH�4�L3�ִ -f�aw���/_,��rӻ�����j�Xً�?���{��v������>�{a����Q��J<�A"�g��`�=2�X�` ��  d(`�e�Dh�h ��Ǽ�h�lt�R`�q HX ��
	~��B��5 �%�L�jL�s�a\{���l���ۧ�uH�(ߨ���uz��^����o?��wu��i���]��<S?��ե;���ǯ���C=���P:�2��!�Ԗ��v:��@�.�O�v���}s'�Jж�s��~o_������I^d�rԸ  �8aŊ����V �@��  �C����Q�/�{dc ,�E �E���b!�&3������`A�=�( ������8��/��$�Cբ��:�=5�]�'��ïy�.�$e���=U�����`��Mr�����Iv;)��[?V�����^,��� ���T�P���:딫���y�.]�)������ϐM���@�����u�Q/?y��+�.�x�mko������m��k�2޾ h pB�#f̈�~�A�+.�@
J\�  �`�
]N\�y��K� ZE�����ذ��"�BB#�/���x�@"�+
h�a���p@@�'J\0̴yi	��5�~�mU��'U.t3sx�^~_��-�,��N����_=9e�DYU����H|������_�*P	�	( Hҵ��z��+��ݻ�Ci��w�D �(��3�ye�m����o��L�{<�sXS�w��}}=���>t�k[�*��'~b +J��h�`q��G��p J� &|t8�PP�P�   

 �D��
�aɂ��/pFBw���#��8`�@D�:��)nH1�ۣ瑍{���K.?~|6�	s����Y=��.�f���0w��ٗt��-�F���7}��G���R�����P=�� ��P3\��0�^����r���l&���C����]�؎�%>������$�B���{/�Z<ו}�&�w�߳w7�+4j(t�c@�#6��p����x E���gTx	Yx!�@���d?>I���XK h��
�   ��XH@�'6|�ƌ�<<��� Ѣ(���Kҁ��`�&���~y��^긏:-W��&e���ؔ��8��	��è�5l5d�h~j�<�l�_�k�� ���)�Y�K(P[�R3 �;�w5i�;Ѡ���Q��̋�y��sJ���/V�4����av�?�y��������	`p�X� f��B�'��	�� �/��`!��F���Xm�h�x�"%���+���E)�SH8� � -4>���5�k�P΄���%�qaW��i�F6�ڛ��]�����~
��(2.vj_p�_����ڮ����O��_;ׇ�_���=�VP�h�v   zc��ẰL�0	� ��M� ��D(��V"�u�U�h5�9M�c��2�Rƹ+ԫ��J.j�,�Psf��6��vV�=*��4�����X㆟b i�H+��V㊄
{�E("ጉ�q������ܯh�,��5��� B�pG�)b�h�!q@�$����Q �'H@Jx�Վ��I���e7][�w��v(�D
\��i�_����(U��}��u��*[E���g����k�!}�ra@OŁ_�  ��   i
1�D���*!9MI��~�L�:�W�3���%'9&�vh��bd�V���|�vCأ�F(�����u�Z�������9���  ���"�b�$!p�F�GLp��!A�
!v��S^�v
��tY���V�5���}�˯���3���ob�5���w*?�.��t�~9|7�褨��k���T��Rj�
�&,(E�tvLs�T��\A8PF�_�������ߜ����#�S�Iϥ�+i5Rl�b�=2��q�:TxÈblqC�5T�q��w���o'��턽��$ D ��!�E�!BX �P��` H $$ސ#��|({3s��(�X~�|��ī#c=j0���kW�s�GJ�.f�V�n��I�Ѝ|LU�zB��DN� n�Y$���0�jR[X̒m�j���o��;{.���O�ޅs.�� l0G�3� F�
 b qB `���
�^��z�s-� ?͡r8LHa񅽶����
=��QAa@ R|  ��j���2[���=��bS"UC�3�-�ѹ�n�2�R�����(���ۮ��(��d�J,C7'A� d$�}3����3��J������?/�4�*IQj�`�/Hq�	r��WĈ�F  #xHL���:�gչ�P����_�;W U� Я���A�
SjO6x��1C ��;@� ���0H�|B�}��ɡ�E�����qФ�
�����2��Qn8��8r��DU����7����  ��M�d@S�t??�0T��#�?�����Y�|$$� 68��b�=2$8#�:�Xb�n�#RըZU%U��.?p�ď����_�  ���^�ӿ'��(�HUx�u�;|�+Bh����;8\� 
fl��ch�q)����*]�o�9�:���Ie��5l�V��l�t7�����n�ރ7P&�t�Z�]K�.�K;�C i��n^��:�5���)�,�q�������/�����G�o�o�,��&�qǈ,0C�=F,pA�8�F��P���Z�	<@y�C����.*  � P4� Fh��8��
<�P(� ���p(�dl�z��h)g�g_`R�̱q���<�T(!������ښN�&����K�+5@H ��t�R�
TU��O�s��{���~���Z�g�g3sD�X�_@�
�أ�=l� �j̐c�-�p8 2��  dC�Լ�1��L X��L0M�&�&�&����0@ ��	��I�$�`D�d�f����䲍�{gވ�-���E	V���Y,0m�/���͗x�/��@�0��"MRv� 7m�l$�lVɘQ����fqh�O��׬W�Ҧ�1�)��Ts�9�HlT�N H�E�Z�'�H:x<p ��PB�����}�1"  ?�}��#�D��*h<p ��1!����lR�5eg(�4��м�#�2�jK�Y:�X���u!*M���rޒϭI  @� uB�D("Kt�x�����U�}f��q�������<w��d�;4�a� j� ��$Q#�A8��" PHU(�"�ϨbA
�'v 1H�w��$��-Z*&s��5����Q����deTZ�b�V[jY�`Y�)bA;戺���տ��+ؒt����iXj	 Þ U��*q�\ݣ��cs"l��y����������t�\ع�w_�Դ��ˀrt��8�V8�7Lp
��0Ca�[FX?)��};Ź�D  @@���`E�1"�Rx�#$  �A�2� 7	g:����-5����غ
ւRb�m��2��`��MʗP� ���$  B	R�]?�ͬ�nl�v���ٯ���w^��sa�:�+�( �����X�).hqC�9
J��a_D. `
  bH(4�B�
7T� 1��0���
*��E&��3h�f���:�C��n��DM�U㳨K�P{C�<ƫ�R�G_M�
�� `�  � Ap}s�u��́���r����s��3w���_����V�4�qG@�� �b�w�c�,�JD�x �-s4�c����  �E�
)�� bhThР��$ 78� %z`&.����]��N��ڶ`dG�n���V�βi��E���e�L�li�  �$ 	�>������\:��0�f���ηߺ0�on;3mD��t�q�+Z���7�P��#R|A�N��P@���l�c�� e  P��%rL"B�"x|aA�$���=$5���0���=�0�D�b�0"3�,�.ԅ������C�f��,f���,����d�@�f�i� K!�D�lҫG?~z�u�4Fu���Nn>�ï�;1&yŒ:S3���HQ�E�5zdX��<0�H���(۵M�WT �'&Lp� 4Fd@P���
`�	���Mޚ�k3�T�y�uq�D��� �J���%v^T�hT�cY�0�y ���.�K� ���S  	   ��u�_�f�V��aV�M������s]e�r�s�C�9  ��;J\0 $��"�P�G'xxT -!��  �
 ����V� W�7� " פ����53�3>���iT��6!U��q�E��H�)Z>ĭ�@�|Hkc�J���r
i%?,�@� ,������m_�ݏ��0lJ���̨ϟ����j�ݘ��C��Pa@�%`��ŀ
����!8!�D��  >���G<$<F�pÂoH� ", d�4�:i�ݹ�O柚���dK��b��� �`Q^�����RE9;���,H��  ���*���̓�2������yn�M�I2O�9`�[�c@���Q���w(H���  ���ˀˀ 0�'Z|C�w8d�#RdH�a�$.��7�໫M�$'�:����~����Y��4K�93K8�@�'�_�J��If���.j*�")���g���~#o���dl�}2�&���L�1F$�$;$8`�)f�P��+H0E�W�P@�B�O�P��CQ��~��~I `���#���<z��� R�x �U7�s�v���Į�bNg��B,%����
�[6 :���1" HX[��R�i?�QA����I�⼱�]�.�	��   �F��0 WxԸ"!�C�U�4{��  +JH��(1��#2|������H��n}��9g;�������X��fKY�([���V����TC��bNE���F6� @ZK�@�P���1�0��a����8�i[3�Bi 	>zT�;@�w�p����

_p y%�U  `�ň��#$Ĩ���8B�,�޺��}NWg�q�����O��t&�ОF}��Ux����Z5Z��)C��&�(A� @XK  �Áww�p�U:��Y�,�:�6�a�JP�B���G� #��9�0 ����'�E�%  �$4Xh8�p��	8XẍSA�5i�����?��������v�ӭ�+d��Q[��w��E8U�`C^zrY	 @X [Z��0�I��թ�0t��4��X�t�-#�:��F Txb�nPc�?F	���3V(  ?aB�+<N�Q��@
��%H(�V��g�Ϝ�?u~x�YE�)���i�-M� �i!�[ihzٛ4�r(@����J� `%@q�V@�5� ��U��A��P=�^�����Tc�l�g2���dZ�Q#�A�-
�X:|A�O 0��p� w����7,  ��q�5���88$��(a�-�[N�c�2�s��љ�ʑY��>`(]��gut������`    @ ���2zM�K�Ы��@Z��*
�  [�Z�<� `�� l� �r Pf�
�m��o��S',�1��yn['��<�pB@���HpD�0"C��'f(�0�3H,wTZ�||�<>]�
 �x@ ��!E��'HX( �'���;)GKz/�r8�{>{�ӈN��;��]51E �Iy���k+(�an\ńT�� �*� �+N��H�)��tY�IFi"5A���l)b6f-Ea�݊�g�Ѳ,� �$���:�f��Pi�q���v�2�$�m���}7Np��o�=*@�o(0�-��{|� 0D�4HQ �;�У�'.`=NᰢE�9
,���K{�������'3Ar�yá��I�*ʵ�v�Ը~���j�w�4��!  @�P;�P��t!�f�Wf���ˤ{s��{���h|V��0V-[o�^q/�̬(k��N%f�P��P@+V�P 3M�9�׳����p8l��]s_K��pG�S�c�#.��`�9���	#$N(�p^�����F�	 N��"�$bL���F�wX��# �:�7��_�;kιf��X	tN��ru{�>��E^"ۙ��[M�%	m� �����>���D�f٭i5�Jl���|��#���q�QG� ^h9���35-b�����G9
��� ���@�,cKv�����ƞV��q����	qE��%^0��� �����-�/j�G@�@��^Q� D��b\�� ��5�5�4��9�yG����m���O��K)���QE���J7�	'	N�v�1%�MH�U2��E�̜�<=��?/iDW���~�$6��Wh^�d���q�ѭD�w�n�E&��Zյ�.ܕ�r��� L@+E�T��:!JR�zl�x�������uδ���d	�b�#R\�KX�!$ppp�	 � �2$dhD�%*@�`F�+<��x�����X`�&)�3s��ߞ���V�f'kC�$R�\S�ײq��,��È�<�J�jr����㋙�����״b&�X�{���߱0����Zp���0��Ԩ��ZRS�Î��o�0Kջ��C�]  +vU�زd��Sw[VYz�s�}sf��2�P��+8�%(1 6�`�? 1$�!N�)�B4ռ�y�Z!Vd��� E�:�x"�Ć>�"�w�I�?�[�����t���`	��l�-P�����z?LW;d���P�� �V;5��:�����YO����k|l����n��ٓ��Ǭ�-ui��K: q�Dw5�V9����:���/(�!�V�v��W��
`�kKmIR�jKmY����q6������sp�K��vɒDA�;J�I�If(�0�ohH�� ��X�� ԧ�ܞ�s{�1�Gx�x�PP(�
)ZD��=�H�=�/��w:����|��qBOI��~�KϢAH������(�Z5:��S����?:k���5��%ϴ�Dn��aE>�uW����[�/K.��8��Rv!^�i^���)�NzZ������^FS�NE��l\j����$$�4%T1���k��2���$�C�v�W�p 4 ��{���1 ����  �@�W�Ā3`��
�cʭ�[��>.q+��y������hc�'���?�1Ѕ;��g}����1:=�S<�3`X*P7���a���~x�u���u&5^}]ŗ^��~?���//~%n3�km_�^��B-�p���h�4�z��s���Dn�-3%����ZՏ��v�f�D2d�����ݱ��k����ϧ�l,s������߽xo�2=�(��Q�f �Ҍf j�b�g�`�q� )@h8�����_�����Z�v����	Ox\1!�@�34a�t<ڇ���_�N�%8r�?����)9#S@_�-�Eǲj�[���e�I7��&�U={�����ү��k/Q}�'�����o��8�G�ܬ�x��G��\kK�(h��F��8��k��ҝ_��g���k��^�|���
�fw�y�/u1q�M����1a�5���O$� P��	ߠ�(�@�#���@�`B��!��5&D4��w|��
k�J�s�7�6�����󭄽[�������K&�}j<gة M�:�:�O5�R��iv�
N{ur7�}�7��g����+?�e?����_��x����W��]�k�Ґ�r�  �-�Z@���8��<?}���9�l����L}�}��<��p_tS�Dk�dZ�Cއ�e�-ØN�L�7���	;Ti�i��;��=����`�?X0�������v��/���@�=����?���Ā""�]��]������3G��s���˝ߗ��9�eUx�rܥݔ#`���Yxe�`��~ך���ԩ���k,+_�kթ�r~���W��m�~h�_W\�0 �72�4�t�~��#^��?��s�w�}����/�{h��m�EB�d��X�S�f� �;.�f����h���qC�
-j��(�G����$� h�*T�3>�;��0c�OX5�� 8�>��ƽY�˅�cO˔O�s��g�+"��� i��a���gL\ɂi�J����yEw$��׼���;߇�������G�������kԍ4z���L�‰�T�oIo���w����s}z�����?�~l=YS���9� �f`b���b+� $u:R}i�Ҕ�P`���W�x� @@	pC	� ��3���|h ��A���79$L���n��/`G�a�rŚ����n9F��7��2��K#]t	�teh: Rf*|���9�׼�gZ����p��o��[���zJ�o��9+v� �= @q�Z[\Qԩ��7ڿ����C�O�I�q����C=Z HƜ��j|��y9Q��K��1���vV��r%���hС�� ��˞o�Fu`�=��`@�NxA�w\�B�>!/��̔������>�n�.vɧ�d����n��T��9jFq2��c<ݟY9��M����}N������ķ�����w���g�~������*dG^(΀��v�ʠ 8`�-�ݴֹ�U�w>g��_�Lҥ��9� p2��S_���ާ]�9�Ӎ\[��~$���D����\��3n�1B#���%f�q@	᱂��
�c�	=� ψ���qF�[��΋������V��5e}�����kJ����t�Z�+F�0��π7�z�ӫ�5��]jM��>{��;U��'�w����m�uqm��m�3 ex�� �%E���7��#K�������<{ -�Q�3�E��1�w}>�Cg��Ï��ˏ�<�{��9B��+@B��g4���E����q�#�����ؠG�O� {t�+�昚#�ʥ�# �����>�ly̍�߷��c9���j�����U?;��rꞜɥF&��q�q �8P\[���J���{G�����{����91r�?�i�:h�X�vPp��^���`  (�ܑF�tx)ݲ�O<x��;t_'F�V3Ǝ�{���O���2>/u��?�����]�p�9CN��t��N4��B�`��}��F[��%��]aL`���CB�*\�GĄ5f�3��]Dq帖^�����?X�O���$�]ګ�S��~�ߴf�~ߔ����'�ָ����9�����r�����i����%�W�C_������5�{�M�  Ln��@��)��"�ڲDh��7#��u͢�n�䢶�&|>=��f��w�>�e\f�u��< ���0�D�=,,�	
� ���ܴ;7��;7�9H����c�3�A�
	��@�ާ��U�:�7,�V���V\�Zn�d/צ�a��������z��y��H_�~e[}� ���sL��N����F|�g|�O;:\�����E�^<�)7.�P'�D7�Cb�{��h?�s佑���M�oi�В���]��y�q����u�R�|��̈ݚ��X`�rdXa0C�@ݭ<�΍F�C��*`�
��5"v�9r�	���K��m���O��v;���y��~~����-]��T[�;�]���E�Z��g;s�U�Ī���
%����%���\�5��k�X����]R+�DV��1J5��d[����n_��2������R%�U�Ñ~���kr�n��� ? ̘qxBA��?S-��nipX ��dw G@�f���DTPa��!���̺�����vG3���̇�O��tJD���<� B��K�Y@���i��H �����^H	�I���K��K����]�͞�䞗*�a�,��,1$F��KNW��U?�19Ȏ���l����mͨ�+����a�#�	�
ݺ��QaF��	@B��{�� �����uP�
9f<�B��E�=.h�� �ѝq}Us�{�o�������ا5[d���=�&SM���[�
0��Ψ�ㅥ�����/����}�����wOA+�z[ ��s<�M{yߡ�b��*�E�8��V�hy�r�qDڷ�^���NM"
x�" ǀ+6��o�䈐D���W P�) 2�k$@�K|G�2L�!b�ܝ��	E��G�_��*:���2������R����{\��>o-O٧� A�I$ {����I��$u��Օ���s��g��=����U� �`|�l�  �Kb��y^v������x��I3�6ˑR/�w�P�����d��W�0W��DH:�xFD���Ì'� $����� ���>�m���(��3:�$|�
d(pDD\�%�rE��x��Ll���a�Q��uw��n2UM�d�`2�@��s�z�e�����>u��:=N}����5�e�   (+C�����y�ǯ������#e4���lBg��0�x�K�=�`B�aF�&5 8�q�,�x�*�V|���ö֐���RA�K��
xE�P`���ܺ�������V��f�9�"��>�7B#��T�Z�D-f��� �j� �3�n@j��+>�������Aę�$�������rp  0����2�P��D�k��/�|��7���'>��Y��DX"���M�}����;����WD�A��V� ����X���`A��������X 9�I*�j��C@�� ��D�UQlW�暚C��akFP�HJ;�J۹0α�A2����RdP��{5F�%�68=�}�:ƌ�]`E�e�p% L��@O�׼�s^}��]�߷� �Q��atYS����a�X[ "�W���!�����@A)L) �'�p���3���8��X�;J�q�	�<u*��3����{m�U?�ۏ�f<�e� S@+��j��^�}G��<υ�A2`L�x�����u����Gӎ����5�-���(��t��\�k�tn���c 7�X[�d�"�ۭX����+ 7D��qG�=�1a������A����I����	[$�	�P�ƈ �4J�|�p�F댵cM1��*h� �X}ywjg�\-8�d$c�zh��*z1�KK��M̺A�@����C�n�����=���+ʲ��=]�E���kn��G�S�pE�%��P#�-���W������9��萰l� ����Ss� TK����]"d��O�'���Z}i���l�m�x ���<�1�mQ�t%�U��a���嵉`��q��sM^m��@�2�x" �/V�o��.JM��W1����+�\����+4��O��'��* p��E�3, �	�	� j�8��3���C�;:��%�a�9�ɉ9�h ж��W���T��b`LZ�5Sԃ����ڽt�^�lrm� U���i�����'s9Wtyt��N�� �"�4 ��8I��-r�@�o8��/x����! �pX�B�������I8�8��/� �ѣ��	9Z,QWZܯ�g�m���K��et[(8�պ�U��@�㜑c$#���é�@h�吵`��k�n�D��I<�4픷DX ԥ�kC���ḷS�g�h9�	niD��>���O�7��p��qBB�3<4,V,P�bŀu)�3��3Ԍ�F�ѡ�"�Lwxi�3,D�=���L�[b@����J	�j30��P&�k\�c�C�$,�$W�a/K�����U�si  ��:�ڙ"��j��Mj Eq����i��r*T�qDD�+"`B�W��8<p��1��	%4 ة�*U�rթ^EL�����0k�4G7�ϗ�L����������m k�>�V�u�v���o`|�����J��0|8e�(ݫ��<wG�4�C��j��{��J�* @��2�1ܠ���sKn�4Z3����h����ךA�U��@�������� ��  ��	��N�+�G��\�F�	:$<�W.�H,�L��� k)�"����]�Q��!
�Ɏn� �d wi	�.ZT,�4��.-�������p<�S�(�$��K�<G*Ǖ�A�d̢5�eN�g�m�<7#�u2��h����8 �
�+   �0@�ژ� j<い	W$,��K�{����*���� [���ނ(D�Zs��Z�Q0J�j�+�a� �u3ɮ:�&�Q��e�zm�@9�/C�/TW�U�2��2���:�����\���~���,G۩�=��8��mg����&o�4E�2�X�ńV�@���xl�#���

l�*���GB��GD�8�9:Xef<���  `��}��Gwg����ݳ�,
�p�	

j�nힻV��Z�� �X�8�Ux-O�2��-�<n˭�����&F7HcN;�V��X�J� r�� b�������?P 7�q ȑУB�:�`�Dl��	�������J�[�� @�C�&���O]���U]H�*U 2 �\<?�1�P�j��+�5E�g��A/"�Mn�Ky���T��0'cxA����et;�<N�~�^/��+�q�{D|���F�-4< � 
 �P�@������`����O�hg�٬�E��h4 ��f{�ؿz������m$R��-��,E5+�*��Yekc$2��1j)����n�U�����U
L'�c�F�J;��lI[�0 �@���� �o(8$�X0aƀ=,$�Xk?Q����Pb��X��
�P����L=&����w4�w_�w��A  P�f �:z9��rn�����V��nK����� ^�UVKjQ�̫H#�n����t�6sش�<ί�m����L� @�����:LHJB�GTؐ0`X!���H�*|�$@�3 2��{n�3���R$5�C��g{�D$ $̴�����;;'DV��VJ�$�8݅ �4Ǥ9�Q��_{�,��4h-���1/�nS�����x=�5`	(q��0f� j�'V (xxx�h����(�,bq���$:!E�	"� ��`8F�R��@�(��� @$p��3A���<$U��n�:\RpR��8�;��D��Y�V�� �I' 0�QF}�2>��C��O��ܟ�9��. 8  ֜h�Y�{[��}�b9��}mF�ҝ�S�@@�5tȱhb�B�	-"���b��\ z ��A	�=b��(�.� � @Z ��Lg
ε�V@ &� �������	�I�T����d���$5{ٴ8�ֽ�&�h ��[���a�C����s��W \ 5 �D�=� ` � "tȐhx����'6TH �a�r��qC�0��oE�  (ԨQ��.^W�ն̆�u�����xA%�;,^Rb'3�?v* �#G[�߫�H�n͇��ޯ��3< �4f��g�9m3��j/]��5�a@�3nؠ�O(P�-*h�ȡ���

#rL @�

Zx� @�=�&�N$ߛL�� v�s @й�70 �$ 5�ӮՆ�������z
lv!�&k�G����?˞F� ��.��)� ǭ9z��qEĄ !!"���D���7tXq�G	�)��񀇆 H1a���	4r�	�$��G  IRI]�8�9��ޱ7~��L )�>>��Xgk!QP �D- +P�������d��+A�d���* J�F��.�Qe"G3ss^�)0!b�+ �W� (1 |!ǄGX�
`��g(�� ��x�� $(�Dn'�A�v  �>�aW���`���v[E�жc����N�ئ 5�=\5���}� p 3kn�K�lnP,m��D�t\�Cg`BDDt�,X�����7�Ȑa�A�%jL� 1��P@�����4b��Aa���T�;���k0�"X-V��"AҶ�w�F�J�	��Q�;?�u�낫w��ۑX��^���  -Z�Z2U�dw6�L_)ED�x7V�@����~g�fj���'<�	�(`1�!�Ŋ`	O�;�  a�@��@��1�����c�|��>A�4v   
�FP:�Xt0����)@ҟk̢��zS6)������` @��� ��I 0�얉m���rx=�=��+`��'��
�3<@� ����#�������q�p��Ec� )f|�ڤ�LcB>�ڽ�G��2 ]�Qp�6(0�T��-,%���&�&�
���a��_��<#BIV��I95�DU������@�2���s��hL1�)y%?��C�r��w�執���&7�AF4t�����hP���=f$X >P���	h�!5�Q�wH40p�Q� E�	-r�$�(�v�v����*%°���1@ �0�zE{k�Z�YK.k�°8�j����E `j� ˭��<e6a8��5�;�z�5�Ƅ+�8�nXbx��h1 ���"\qh&L���B�/�Ĉ %��m9���.�A�-(( �A[�w���s�+0A����~�ߺ���{����%�}֛~��S����]d`V��G�J�e}l\�+;W�W�.{��.���uٺ�,�J-�E��$�4�4�����O8��� E�;u +D��X�O�	-  G4 � M �V  �E*L ���0 "�x��������,��0�)��LJ�F���L" ��my���7]4�������"jD @� �С����8HD� �;�%r���� �E0B�496�	��JP `
 @w]�k���t?3� `<47�V��%�����e;U�3  �M@���G��A0�A��p���z���;Uj�8�E�	5:�xp8� p� @�jl��� n�� �8 ������ �0�dЉ栩A�(j "  �j#�q.�u�A0 5 ��5  ��X<�y�*�m"0���v��d��@D��h�kj|��
�Pr�x 4 7Hd B� ��<J����!4r,�A�@��-���O0	"�g�   -$��zf�u�f��tua ڪ��"+O��������猦%  5����S����W:�t�95�`v��(���t�;�x�	K,Q�����`��X�&$H����A� D�Zh���D�+�B� ��� �jѬ��P  @��ZR\U�  �ts����INH�ʡ�lP�N9Ul��=QC/�[�]9�j4 �@p�n�śZ(�"�E8��X� ���#:�xC�=(�����"�xb@�o� 4&@2iUmQ�	fa����;��FN`�Π�V�����2��Ω�� ���!�I��&y2�������U� `ȡ9 �����'�����T]�h�  ���t!��Җ��R�-JY��*�Т�Z-ZA��Z-Z�V��0��`��pB��(aD��$H  P!A��S� �3���d�)ke6jP���
F�Q]��c�G��I%��V�J����Y5��p�;��`�9��3�gh  8�� �J�2���,����
+�pD1�',��74��� =,4F,���7t���7� Θ�W�8�/p�F�GԂ�����
�h�����~�L&Ƙs̍)�[����F�t�pr���4�W= ���)B�I�'�ǳ�p�6�L�K�ƣ�G3�f�0 "�	)V,(����+f���@A�	 $�oH�`@�8|G��� j�-X00	
��   ��q����`	� �.5��!P���MW��`��f�0AR������m�����,�Fo�� � ��E�l��`D	���*Lph�@�+@� �Ac��+jH�� �Ul� I$mծ�Z�#$��U"�
p4E�����{�UM����d:��юܖ 5 �aXE�x��n7���(0�	�ֲ��ף �C�g�8�`� !Q� p���cB
p��D�hrHP �x@b p��F7�S�K��ma�� �!��uRj   U ��  p�bХ/��;���ڮ�[M4p�v�b �� LHآC��Q`D�#F ����q��� D�+jhL�1#��
����]��2m]	�_�4�q6����ݬW��t8)8�Ko�`'�� ⮣�+]+t'�I�Ūo�����p�������wSQ�	�� � �`��	=���p�ܱ�@�^8`� b�X���Bx��!���G$�@
��C�;d ��g��N� @�� �Q��*�Z����BE�@R����
 �+�kOFcH
�0ܟ" &e?�����{߿x�>�G�>f���Iw%b	 6��@����0� 0`B pG�'�A�h�!�Ըi���C��PVCi���Ҙf��,]8ר�1iuwb';8:�`[ D�Iu�{-?ɪ��."Qt-`�p�� H*s0/0����'m�Ld���$�8 Co ��V@��Z	j�s���/��ۿ�����߷��*͗E�`Z�0�1�.�� i�iN"�Z$��,��@a��7L x"D	�=�Ǭ! 1�a���8��E�+Z� T[cI"��w��`�4� ]�Z\�1n   V`"�d&gR
 )-`L��� 8R��V��I@A�S*Ϟ����������Ty�~������N��gt �� �F3}���LД���E�g� OX �W� 0�� �B�`��#Ĉ	.�p�aw��]v� �G��	���:���
[ܗ3:�}  k�F,V�J5�i%�D��+�r���?�?����7��k�S������t �7�h��( ��?�+��X`�=Ψ��!2䐈�!� C����3,28� @b�	@
�U�*�`	n�Up�࿂Q{��d>O Do�W��b��� ��Sb  PPP��Eϩs�w��r��[��wί<0�Ͽ�|�+L�Ѡ+�+m�"a(@�	[l�c ~`� ���P�Č2$ VD��� �	-88$��35�Q�����ݰ�h�B�SInU+!ؤѡ�  H+�(�$�V�jԨ��� C�9���_���������k����Q��ؚ�UUTŇio�v��8:
<��#N���=��*���1C���3R��� �
7�7 ����#F�IT0	��R'�ѕ�:� �@�tDE-`���4�	 CQ����;���?�~��]�����}o�W��$>�-F[{Fr�`��+JlQ#!!!G�V�� �PC�d��<��  �$bT(qÆ,� &�H@��
�BT(n�w  �<R����0�ق��j�#��*J�ʍUa���.U�\�� �0Y�ERd�6����?���|��*�W�����S|i��y$�i `x�p��� <j�x`�	o������O �FH��0#A�`%� �CC�c�����A!(�:�ih�AN @q2�)HJ;�Y�$��jM�H4J��̯?�4��� ` z	ŉL圫��{�?ۯ4��#��\���=�Z���� ��`��h� ���0�%>��pB�W�� 1f�	z4��"C,V� fA\�N��"."�E�E9�9y[�x�y�1��}�y�;��������b��-�.US�5@��t� �6��ʽy���zƶS��ܓ���ɐ(BР�" �B����������{���޿�������^<�|*):��|7\�+%�4#7��v�[�vA��~h}ע��Zk��&� JHh�� <D�bh��hpŀ�'@@lpF�+J ����=�����h�f� N�*�a��¥&6  �S��\�c��Z������(],)��D�+�@dI����S>?��O�=l;'�C��.O�և܅' � �Q��K� ��A 0c��|�/��$��x8�#�!�m�+(q���b� ,�a�t C�����WZ �Ȫ���Z�RV��-"Cԕ��X���V��
�xxa���?���s������	G�敼̥1b�f�>�����]���Li����x��֋�*��!;��q/�-�ʵ��g���""��lP��	7T��Έ�"G�Wl�q�x�U=r\���	9j@�W �Q�����Q$��m�u�� >�<k�G���% U*�$ ��>A��e#E�	��Шg��)�����G�o���6$�n]����R�R(�ۂ�2������5��
	�pB�5z\p H|����"  �P���� 	3��Q"� p���J�j�%�c>F��+-:-Z��0E j,�� P� ���]�P  ���D��x%ۢ5�L�f��Z?�k��_�b�˿��oY˲���yFA����� �c?B �ht8��������'$�=RL��x���g@Pb�0��#���VJD���`]��QE��  � ����< �c� %@� 0�f ��$b9Us��e�������a����ԏ���e�����B� -�l	�WU�� 
L��pG�	 �G8�	{�P� 0���0���`�5n8��(�}TʁY�w-		Q:����p�h���� PcW��?��Gd;J�m��8��A�ӕ���s��|��W���{�{��k����X�h�����Q�P(2�&�SrL���v�[6Ȑ!�6H�#�O��ǆ	
-Vtء��6�8bp�Z��8�D��x�ؤAd"� r�VFIH�ٕ�^��� zҥ�	�u.�#�*��=�@� 5�h�   H0�O�y�v��:�x�]��_�_+��u�u[ @�@�qF�� �ƍqL�JpAz�Ot�J�	 �$�08�H0� ��q�oH n�  G�"���j��Z/ZW���h��;Uw�Df�T6c(h�\W�Õ�@�l<��>��k�Ω��)��ҽ�Z��-"�S}�8�i����n0 #"�%�(	v�<���'��_�9�5j������]��{u�VXb+�" �id������.�9e�����5]��DшI��QL"�&Hpp�E�Y0��G $b����V�-6�_hp\�ƌ'tQV��F �Q,[Q�V�Ar�D_�=� s  �ZSM��S�(mvM�!)؀8�TE�@ʚ�t���N�mfKG��j[�}��R|��5�X"�  0�h+�K��2����c	(`BD�����D� Hx ���"�"	B p�\��+��+<��	=n��{�=��{�'Fo�,cw�4�"�!ꪭV����D�U�Ñǚ�f^�	�*ug�Ԓ��V��  �
�h ��N������_��.����#�X~����Z& ��E1�(�ٖ�-��a.�	7<p�1�@�
+�8�	v(�#��	
��1f�P# vXcB�H�&ܱF@	Gj;���	"���� �n� `hp��RLШ٭`��	 R��
���(�D���|)�;���/O�8��^���H����V��!��qp�,�t��R���",V�jJ t�gD�b���G�3RD� x$��D7��(���5 ��E�;���N��-`�a�.�_�i��u��� �aR�rk$ ����X���/��"��e�{��ߙݟ=G��J�[�ޢ~���.B� p B `  @ 6@[N��2l+%<�� �F��3&� ftH��Ƅ. ��h1@A��~�ߐpB���LX�+ ̸�X�4F�r\$��n�B@[  �h09Z�i55���f���-�uq*�K�@`% �d�z��������wU����]�� � �  V`� GJq��i���YޓrbP�0#�ń�=� 4�xD(  "���?���(�A�=~�%f,��SH���P1�lݮ\�)�"JIt��Xٛg �D8��N�&����>���ڣ����j��{ ��.�HH�i�]_z��U��I�߽�� �P\ pV`�+e���@J��e�׀	K,��3N���j��H� ��/�!��;��a:�Ԇ�@�����'$�.8+�Em�$��;� � �U��TO�%I� AG5�Q�-}K��մQ�aj�WF4  #� VA	&m�/�F�
�v�2�q0(�\�eH��'� H��rxJ�4�({F3P��a<�ŀp�	��|�	�@� =@�="tZ�B+hE�V�I+	"�Zt"�ZD�E(f��6��Y���}h�q��(�aD@ k���"2�"�H�p���ڱ�q��������(��K�%J.�! "�e��K��rb�_��J��5�H�b�� d�A�k��O_��}aY��ȹ��(�A:bk@��2
�2�)����`�
�b@����o8`�@B@�- �(V���:N�զS�� b�jR���1Z0   S=Z�Gmz������ 6?ᷭ�]�  r�&�鸎�c�jd�m��X�c@! ��F����YFc4^����8HH�`�O\#r����a��b� 	VH�}\0b��%\�����(��K,�Z�qt�l�q�-`%�W폱��'�Ph�HnN��[�ZjD����΅
�
� ��[�e��%���p�㉔��@�Mmf�R�B�Ö `�\�~�Z �'�%o������OXc�@aC�-v0pX@���|{#HxB��	 "�8�	$t��Gʬ�'�a   ��M��0<RfDO �����ct���A5�9 �Z ��  EJ��j���蜎�7����&-��AE$��D�X!Jp��85�ZDL�h�" <z� > &\����@a�	+4��_x�0�&@��� ��#e��#G��)���ws#����r&f'E
�D<�l#��LRB��&G-�h�G���B�LS�4������h�<1��y	%��ÖbEmEQ[�EԀV8�&@�8"�����C�@�),b Hx�Lx���xǄ_�"  ����� �  ��T�C�h�Z���CD\���uѻ��<U�H� �I4"�!{d�qN���Ȥ��[:20҈[R*P� ]`(Sy��S|�[���������Gx�( �x xL���=2� 9z�Q��3ްA�dX��+r|����x���Ժ-tK�@ �R]7�yj	@�u�����6-���O{;��l�H9��������+˪�\A�˰Z��]�Ǟ�T[��x�|�"��յ\p#l�e(��PNX!È5���#:( ���������� ��@ & �� ؠǌ	F@��o�:!@��ˑmɲ����x��u�鍮��&]�cTТ�m�5 �4휵���w��!��Qi���j�%yGlQM�=I!�4  `�N ���58��]^���vC�3F��  9
�p8��@�,���1R �h�,�o�gQ�g��(Pt�$���a�lͫ�<�"��J���gz�F�:�A�I,	´��0S�����Ӷ%�ǹ�yS��LG 00 ��b�  P@P�Շ�xD��)'o����s�f-6�R �i�e3v#`�4���7��h<�_�{���F#��Z7��V��VZ��V.����1��� �P	\�b�q���{ <�
#&���-ݪQ��d�Ln��Go�7���1�dX��� )�@4��F I����6��V�gгp� ��PyȇuZB�t:���cNv��	�(�ٖ]L;�##hKR�[{<��!�'�B@�9<R���A#��JԀ@ Lxa���Ȱ�[��p����#�#O�nXH�gU��!����(&���UQ��
��+��QSﵻ׷o����vy�ߪK]t��ޖ����m�ǀd{,'�;1�g��LE�^�(�S�('�/�K�s�-�*�c�Z(0�n(pČ̨1c�����N�*�
9f��qC�VxDD4xγ�����(C��R>>, ��sO��S^se=�D �(�v�D]*����v�J^�,��@R�!+�����<���9�zlz���^q<�cC EP������� H�P���=��q�G�@��Py h�T�#2��"&L���4]�/te&e�<��#/p�ך�ׂ��@�7� a
� D^��a�h뤪�#�	U( �! !X%U$B��$r�d�)���xʾ���/^�
E�0�MA�`�тU:��)֘���
P�1R�O� `�;��T��&(p D�p�;"L �=B����5%X�z��
Go7>t#��# T	�SN  @0�e��ĭPv�N�Q�2G*0*�J���ʫe�c�9�|�k;���Bf�
`�G�2�8e�b�,c- �{�#G�/�xF�� ������O4X�Q�vω�'@��ǌ��p�/x�7<�I�`�� X.'DЌsG3��HL� :]2W���`�ٕ묳3;�J*)8�:T��A�(����2��klGu?4S���g��.sFW�S?Wܢ��-, C9�W�0�y3+Ԩ�#�#�8"ƌ1B��r�8bC ���0�oo�H��G�O��F̀	H8"�em]M��Y��y���|Ǹ�Z�G>�� D &�� �N��y���L
T�4-]�P� 1�(��Ga	-#>�$�Y��L�F�����wR  ���+ye�xEǖ�^���.y�nN��&��:HH�0�=b�X�U �W����*V^� 18884h J����ڬb� �b�w����Ax�6S4-  2 ��c8)�f����~_���s�- �H��]���J꺰c�% B@&T�?�~�����o�/���������|z�_�~_w�:���,�r�|.M.��JW���@�A�"	��a�Ĉ#R �c@� <����|CA��)����;
 �#n��b��
� p3����k��Zt �&8Ӆ���	;�gR�#pÉ�B]�T��!�`�Ł��5�_5>~�c�������dz�������O��k����V�4( ��eF�fL[���I J�
5�� �F�
F,�h ��#J !2� 2x�8¢B�, 9FX�y�
�(�W���X
�pӨ��ZԵ���_Օ�Ry6���Qm��ڍ��P�  5j�orI���������~����p�~o��ʿ������u�l��Qn��d�C�t�6Yi��;F��Q�0x�#�ň?�9B�44,n����� ���@ͣ�BA���\ �əd�3i��h���ja�K m�:8��S�
�%-r��	*�,?���M����������/~^��~|}�g�-�hT	
�?5���k(P " $tH���0�cA	#���h!`(�G�1z���!�Ą�����ŉ=Y�Ab�L&���	nAk���D`�E�n�5�
^S��H��Ԉ� E�J@)����^/�?.�����5��?�����k�~L�КQ@k���oVK�G\���	3$~@���7�x��`!`�#�@�1<<fL� �G�>���KmM��Bw`5�s6n����ҁ�i|J��� Z�U�@�b1H�&��&��c��)���Sjz��X/������:?��������>��@� �ІV�`�_���޵%�b��=j����� J����0!�X�D�

vP��b��
�8���aGbs�."~�>&A4��%3�&�B��|�����c���ҩS\I���(�T=�Z��ԥg�z�.W�������_ݞ�����/'�Wvl"a��h	H?�f�*�&MĄ+"��C@�zQ!Ɔr�H jXX���P#���00�p0i�iI���L����S; G���4Y��=�x����U4+-�r �ګ��JWhK[t��G�T7?�{�*� ��%���2���?��V���Y�9�1��v�7�+���v��5� @�"�� �pE�_� @� �	)R1
#"aD��*�Q9�
EZ�]�t��ik`��:�$��I:�}�S�4j��2��ߛ'�^V���� ТE`u�Lg�&�E���3O�[���"��|}���3���19��(��.ܕ\�v #GQ�c=�֥�������iy@sGOUF���������yw����̄?W@�w  �pX� G���,G|�	�`A	�H���#Z�5�;��#����;��z�3(A���zH�[Z����D�@��Q�rѦf��g)�=�68 �Kk{�	ݣ��d6�b3���!�JY-0��n͘��
h1�� �@c�!Zx� { �������=HT�q{��
�2JAA^���W�um}1^���s���'�N 
�[����c�_f�{9�s�y����+j���Ѿ��� �eߵ�7���s8u�Ѷ�5h����͞��ԋQ��t�&@�o� ߱�C�&�pF�'�Xa� �v 1����x��r<�`�
}I��$��&E� �9�5�i�*���RF�3���t���1��[�dK�,�	��
l��
������j^�2hЌ�r�V��� �<�ֈ��O�0ኟ �+~���aF�	��=4��! �"� ��
?��)>�#��⥫Q+Ut��]|�4��L����BJ[�M���T�۷s&�ݪ-0|��W�F�x�q��uǜ�sU��߂�@q��)p��-όwd8b� 	=�Q���8�@`B����� ;�%JD�!��2tP8B�� 葂*�0�ā�` Դ�U1�� *f=v�S�%Y-O�0����kR�}J������F��.�m)5�T��%j\ W��G�*|�b��4�C�	!"lX��c+FH\ ��5f��SP���v�]����k�_UF�ԀLC�VD�~���sr��0a�pa|��pW  H߬�2<^�_ݸ������kxZ@�������1�� :��c�	�����w���;�!��


,4N�0��J(�xxH��0�@  �D;+���-Zt�N�A����Z[#5R6�0 0����>b�*�u'�!#J�w�I�-"uUc�U#�?l1�dbs+V�²�E�cƄ	��t8b��0��!��
�a�ĸ�(��PB��J('R1���N4��nIw󓰫����{�ҁ��n�'�g?;�hP������	0@����_߱o�"���G
��S�f�R��C��K��D,uه����0tK1B��P����K(E."j��_x��F�E/2��Ǆ#2��>~¢x��(p����� 
Dpi�_��>+����AV��ν�si"��b�3eX7J
��=�Z���K;թ�&�U]U��:�'��W��3< �:�3�����7,W@�5NH��$�0
L���E*
����5y�+@��>�C�9TxG�		�^�$vW�^���չ�;�������.�k���l�ϧ/j�j�	�<y��v�/�w������G�z����ھ�p1�QF��-���T���m�-�=x��e��p��;�a�(P����'�X�0�"�N�bE	�� ����"\�;$��~��$����$��S9\�\�=_2a�x����̀aX
TC����Y׊�<�1��u�h��]� K6���="0������PJV�X"րg�t����t�1��-���! �1"@�`D�;�#���( �OE� J��M���ǹ�;��N\�����n��A�I5��Q�F��0])�'ͮ�zI���s���<<��U���_�*c�ѻ}���"�H4	 ��[����D4 �  �=fxHxLx C�'R��1C�	9n0�(��1��x�b��EZrw�֏�X���N����� �?QA hU+j�L
 ������3{��
<]�Y��_�޵��п@d;R#��M	Q�h=c�*�3^1a�j�"��È)<�x� R����B����D�#(���1!B�3(��m}C��f���N����s���ܹ>
u���9� �!����L  IN�����f]���|���s�3ǙQ���z?y��ޟ���n#H�Z57��p����%�(�  `�	+t���7tX JdX��+6���#@
�*�#��=�2H|� 7�
�����fC���*bP;�ΐC��B��V ����|�.�⧞��������~q�l�`�����֬d�Td9Ƌ b\�tEgt���ψ8`��P�X1#G��#�(�%
 	��	@�4�4Ӵ6*���I�h��d&f�u=G�d�"Q@�rw�A��ըѕ�$�Lߟ�v�����Y_�ds��n��=�IF]�u�Zf�ֽ�<��#0ݕ<��t� 435�0��# ~" �[HH�����N�� �U�25*�! $<
< F8<1 4h�L"]EA�N��e@�L|7�Y�x6]�����������c��n=�sS䄉�d��	�Z���g�)�#�� ̹k�F ���%"rt���8�O�8BBb���=<�SZ�j@�#:dP <�P��1V�xa��J<�&�x=��}g6w��=��<=w�}Y�VF��IT�d���}��ʊ�  2}6W�!�^&`�z�c�8Y ��[�����9F�~F�	�-ҚiЭ��c�gx���3ΘpB�J!���p���b��8£P�a ��E@�
0 �jA�߅���$nb =�C��b\7jf�J5�CiO]iѕ�ԲC!�a��T����u�%+f@�Q�uK�z�H8a�3z$$���A	�=&U��+z��c -z��q�@�#
4��Q�%G�$X-�A�cm�@ ,��0����ݩ�\jO���YW Q�fV��>KW�f�+m��M 5$��B:ӡwp��׫�}��k̖�1�b�r�-4�R�"�9V�N� ��p�� �0PP�Đ ��(�H�����X�b���̎qZtmd휫XI"��Lcuf��.K�{)盧mqK�����5�J�{K�IH�ZM4��&hE��XkR}W��׾m�he�VhP�C@���0b���1 �`�B#���-F<�1�A��x!@�x��$��%;��n�?2������:�8�=1V�K%��p�/����
 � 8:���y�I>�����$3z�Y�?S �����X<���}}q��6�e(CیK�B)E�dwX��q�92\��xA��6�=0c�f��+7	0��A�B� �h8�<��"���>����#�c�@��љ�=;��?���sp�)��=KI���'>����ߟ��Kvf�g��@�{��#5�+�U�4�ϐAƈ��H�L�!*��H_p\�L�` �@�OXLH��#B�
)�� p�������3�H,��gʥ5®!��S��@&�&�L�N�f�g�U�s��k[{��
#9����!��3bi����̩�k�p�JDt����$�A^P#�@�d��52)��ۛyP��y[�63�k�>շt���7�n&��F�-V���3j� R���àƄ�R��1�!A�)4Z�@����� ���z�JΝ��3�{F�H$�f�P�XWE�%g��s�@��&E�J�����,��;�V$�]^Z���;O�<>?!uۅ }�Kx�e�M�5#�H;4�q\��nD�7�4s���u��;!$
 P��� "X  � Ă^�d1`���x�	���j�w��'���+�/ς9#UV\x����>O;�5��wE{.R��A�Y�6boa'fj��l�c�zE���j����7β�j�� �'Ź��+.���L?c �Jyc���n�vK�f�\����=}���a-H�#
�أ�;��6����v�h��b�A�^ bd� Oh ���XpD�~ �X�Yg#-
&0�Е���n߫n�U�Y�   ��HQ̚ǧV��~�C�ǵZCS^w?�����ây�q�ﵤ���
&j�Q�1�VN�����r��J�4HK��	= " �	
=x��Ol 3� ���=&�'R��qB�	f�Y#ո�]X;�)v�I�dCN��`���j,m\���b5F2��`�$�G�)׳K�@��-�jee2�~���zoRYQ���)v�;ۦ�s�l������<L��H�Ԏ����5�~�w ���pC����#�P�c@��DX�a�w�H��  �$��@�=�8�}QDqQL?�g�5	K5~���C��\���   8��T�`���ojt��JԦ���>2@����]�d�#�g�1TW�Sy'k^E'm����O3�Y�u<�?Ӡ5gM�� �� =� �b(�p ��z(X8 �$~ACCC F����BbE�rhlh�����~=���=����sNq8���9��5���"��w����ͨ����fZc����>F�t���E�uc��ة�����ϗ�^K��  �   ��������ǽ>�s��6��"�E�1[K�G����;�w��k6+R�VX�	~B< �C� 1���`���X�z�HC�`�p� ��V��>��Zdcvb{:Y4����?��m#�ݹK�h7����a��vz����v���k����_�9�;�ZZ���%5�6�c�K.�j���%9����H�e͗/}���m�>�A�N�h� G�	_�# �1!E��XbA���1��7@�"�H!��@���Hq���A�Z�ڙ�2���DH� :qf��OOU���:�>�D�0/�R�9��YO�Y���]9_�S��:�!-��__�v��	͕�  �|�W������������Y��ж;e�	���mt��e�K��.��O\��^� � 0�b����Xwy�@�������6�߼"�� ��)n����8��op�88�ݰ��T��N�dOg:#�2��N���}��>Skm�fF������뜙�Δ�:�nQ����Z��׈��  8�(�)��/�������v��i+%J��G/��im��W���2�٪�\Ȍ{3̀
��=@�
M���y���L��  Ŋ�a�B�'�pA�w�QC�	nZ�'ut��I�x~w��U]��ʋn##:����?έ�cr$#S`��ڎ�Ž{S�v����=��$�Y���zc��[�>$���n+��� W�������d��y��]���kw������ӇfK?���{#a�k�D�'�X�O<a�� {�h� �gk+qC��t�3  ���Zh8hHx�
 �����Fqw{N���/�V[��b�`Υ��Vj$#�DoA��V:���^/���S�b=��+6<?!oRɥB�>2�U]�K��ny��a��V@�wX}�;G�{~}���z�0c�O�Ϙ � n� �c�����^O7 ):l�����$:h ���` -
8T�^�..]�lP�����?�Ϩ+P��;���iݍ�.7i�93gN)Υ�R�9�f�4�Q�c|V��Y���<���w��˪�� ��OE�FH��*��=��7P
L�G��;�]��+ct#�FlkK���i�� �B�,�� Ȧ`z����>�"���,��A��x"A�#��C��j��g��H:��Y��9� ��y����$��RgrT  N�,�GԀ$����M��>�9yKw����^ѭ��+U\�$)^蠠���Sk���|{{]}8_?�R���h1�>���my�bk��l{[SVj��� &�B�	z�M�Mj��y=��FwF,�X�aA�4rx����#���Z�Z#{X�����$�,��> ��G��������\{���1�39�����Ԫ�`I��P���RV9��sj�ri���ջ3��%�����{
ං���b �  ���x�>��u�����҇f�;l�Zzz߽�ͽ�.}-/�ty��޺Ϧ@�2���T��g�����8
���������1d���?!!����� �+��� Z�X �$x]��]5>l��UD1�8��1��<d"m�t�-j5�fAQ�1�(��^�}��<i��U��'���ZF�3�%�K��T`+0��s��CHO����Λ�t�%)g��!��Ɨ���ϗ%b�f*:`� �O �p�_G�jF	��3d����FwO����$x�С ���!�؋T��
�
@10a���E ��������vՕW���I{/���f#A�R��P�������6�|
�,�{k�����pǶ~vt�>�U��K [��XS��ӱ��짠<��u�ѭ���<�p8�p�W`�'�����i�����ϟ�O[9��9?膎*�IQ�C�TO�
 �(�p��a����1�����u��  W�$F4(0b��@�3�ŀW���Ph����=�U�ݝ�h��Y � ����^J�5���gt9񄎽���]����6}���~���C�	'�p�;�(Jn�T���c�r���Y:_�\���r�k�o�7W9eJ1w�_�}�i?�ˢ������#��$8�8Ht��G�2t���`Æ#|AC@��G�;£Č :��*���Z�w���J�|6��֝�=[�����z�d��g|�O�591���IvB�(JA��o�<�v\�5��ck�̤&vG��_��{�'�}��Wi)KG�p=j�b% ���K'?�3��{����S�E]L�`4��-�~�DYbz������u!a�롯���Y��i>� �rl�	�
�!0"�Z	�?��f�  �N� � ��
�C�! �V�Y�%���^�� ��=�����O��U����s&G2`0[ @�C �F��	&��e{����2�����睻9��|]��!7�w��~p���R�.ƃ_�r�ǯz~R���?L�i������;1������c��{�F�t]}Xc��@@�	'����!�qǬ�q�G�]2�@b�  !��p� ��3�أ� L ��4g����"/\7�l�ܝ����|cahc�L�n?�q�S�u�K]��+���B����jٗ���S�A��M/v��m:�Uk� @�wd% �Zb%�ѧ'��+�x�y�$N�8�Ԭ(0��7��7���27y�:���6��S�N��q� [tH( �� �@�28��b���
�"� �������wD��4���۝���}s�l����~Nuf*~�8@@ϱ� =�'2  I�c�qќeә�X���aMm{��a{���Sm�-i( E���E�e�-R%��G��� /y��2�i�ѻ<Wn��Q�������4'� �" " ^
ܠ1�A(� �8�� @0�!ƈ!.(���>��j<�УA�Mƪ�����&����k��z�[���>~�SJZc��ޞ 2�Nv��R�n+f>�ZjF>ӓ'���~뾽}}<3�s~�y�&>T�]^��.L �wql�Tw��=�)d]>wg=0׺������ܭm�̂�˞�|��T;�x8�=�Qa��4��~�#]6�h�K��,����`��L���� GLX��C ��g  VDH0 	��愮��n�ӻ_]�t�m��3�#L���%۳sD�3G�	����@v� ��Ld�I��]�]}x��ڗ~�����N������d�n�Q;">����S����L����l�k���v������Q&ǐ˞�S߭;�Ӟ�ć���f^7�J	�̵����WL����	�����C�Rx����,��a�s��A�!< ��AcF�=B��i�hH�qC��bw�gN������c��u���O���7�\<��R�s��5�ֈ��	W\q PH�P�hkn8��u����H[��&kY�[v��{x��˻�t�kM�Fc� V��U\�M�������d�Kg��^/i]>��7��O������L��&�nk��sif�}���~7�o����)���EM��\��I�
b���� <f �I�
�9��o��zH�p�a�G�
9Z�a����"�A	3��jm�Zeo�c%�6t�՟��!�^����tU[_��
lV B\�T��a�u���w���rj��ϧlKzD��2F}Ϥ(/g+��3+VRh�]qfJʔ�=��}���k���Zj�~Pq�Y���Y9��;�(���������Ί��g�>��"~" ".� $�C�F�/H��j���y��^W�� ���� !jx�D�7|aC�nxa)�=	�뒾jן{���>3�{��ު�Z���\7M���l_���3�� ��W6j���>g|������]J�''�|B���7��/��r�%��gDF����ׂ
��������6��s��c��Y�x���u}]5���� �_XW�Wnt���ƴ�r����|�� �(��O|�#��q�#J�p��1�x`�!p��z�3��/�g��[�@�<f�^�%Rt 9Z| XD &(��Y-��͉��:����꽻�c&��g�N�s���Nz�oF�2���y��u�z]�:L�I�.
V:'�S�r7s��[���l�jK	B��=�8AT�V�_����._��ZU�)�g���y �HW3�X��������"�2���2�K�
�a�'��:D�
;$4( R��`{t5��)@�sA�f�@�B�	V���!�B���	W샱-���W����Kwk���y��wԽ{������ԧ 9T�E��p�pp!D�j4&�ź�hY��u[�shܒ�hMn�CM��$��ɻO�<�6�����}�YVm��uM���c��Oe�<����B� d@���4�tJ����٩[#`xE@�		��oH����@�F�/ l�Ƅ �g��D�7��� �x��HzX����Oj��q���~��������O��l�n��u��B�V�|l��
�	p�e.�"��T[��Y)T�A{�yo���ֱ���2S�l�V�vb��`�N�A-��[Z�6ȿ'Lݟ�/)t�NU�5�G�O?~ߥ��r$>?�~��#s=Zqt�@�VhP�<N� |��{<�Ә�?1���13��A �B�B8lh`a��!C
���J���u���u���cs�Eu����{��θ�W_��~LF�~��;�����������K���7岈����mƺ��1�m��c���w�^��9��;`�iˌեmؗ-i�f���t~a��g�>��il����l7.����k[��?8���&���@��8 `F�	#�D����:N��"�~��߉^G����� tx���@�<fᐣň	�Yj�~�cZ���M}d�H������9�[n�<�u)
sf�q�~'+�,@ .u	B�˪�Z��b�Tќ�`�o_9R�`l;�1Q���*���IC�ה�v;F;���f���T��QClr4�+�q�1�[�!�l�:΀-f@�	�� $���w���;��`�Ns���<����}$- 2��!0���``�B`��@ ���""i��h��L�9��
fB q��b�u�yR����rwi#/{��K�SpS6�EP�� �8c:��NvPc$��
nsH駳f�W�r�.�
����S�6�E�}�4秊������K�?Y�W�ǝ��Z,�M��Q�C��@�BĈ�Ox��P@K�����������A�����w�1��ZhL0��Z\ђ�UXE��+��?{i��X)�'�]V0v}�i`j������qdm�8e��V}��E+  @Ѣ�t� `�R:�Jk���7����Fʹŵݏ߮��9��t�.X!"�wL��	t�pG�&�p�ŀ  ���  ��	$j\���"Ǆ/��D�˺Jg��U��Sh���w�S���Z�C��$�����o鷺��;O�.b��F��B�Mk���x D�B����1�6�0�)Q���쟞�6g.�V<��o�v���T�;h�"�2���	+,PbD��?(�"5���+ 0A �J�  �X�G-����	.���
4i��T�A���G���ڶ2$�Q�����&���L~=�l��'X�=�Pk I�E�cPm �oҒ�R/��Ö�Y2/#e�c�L�%ڸ���I�F�k|�=N�Q�2d��a�-VH�P"7{�}H0m`  �zh� T�C��C�@�"�S7JRt�tg�V籏���A.�ƥ��a�1�2���w	���V����G�%�,e��8�6�|Z��O��Ɠ��Z�w-��ֿ�M��.��z��cD��	'dx�Klp P�p�`��4���^��K   V�Ha�P<��	0��!����$A�a��ZYy�'��|ɌKL��AUu�E�_��e��e^�X��$ \D�/;�"��!?���C�&Oֻ?y����ϵ�bM�(�� ��q�;��0�qÀ
HTH  ��{l��5�  f �!J$ذ�	�!������+/]�r\s�=�k�����w�_������$�Jg.)Z���0#4��o�p7�i��C����R�4Bk�)kǾ�^�����}��|�2ι�����:���9Suz�	�1c�KlP�wx�hdx��1�c�jۖ���x�<K���X  `C�@ |a�p �cB�@���o�L�5��]�~�W=��_�ֆ�Z"\~Q�`D�-���9H*�a��*`�@ �5h9�2�un/�ys�`�7so�{�����q{���X#C�k�h�P�@�O� 48dt�a౩�=�f�6�  �����P+�P'%՗B� �aP	�5CXe���½�f��!F��S-t�.�l,$��n2]�ۓ�M^	"���$�h���\�7�t�n�9��)��t�`�6wH��U�6�8��#.��06�pF�&<����UP� d�۩WTA �@�:%P|A��<>P�	��A�Vj,�P��a߲[�-
d���|�Fe�K�C��sL�
Q�8i� ��`�bJ��������˖y��M�=�_6���i�Ƴʫ�z���2dx`	Xa�P��  ��x�`��l ` �@�46�p@�jlP��	,ZtQ�2��&��
�hջP�I�����f������(:��D����,  ��a�~�}�O]���vrxe�xA����.͔fƴo8b�9
,Pa�"��tJh!�@D�H�JDH�
���1��#�1@�=��r,�,���)��#��3Ri	���'ŨxK_��L�
�!�HrJ ����g|0o���7���5�X�6o�Q�DnU���p�	{D䈈���7�o�� � J0a�^` `0� �!���C �+&<pC�Z���Fd���s�\$9���V�������na�37�#4$MW�æ�C ' �a�H��mt�^����r���Xn��n��ڱ�H�p�:@D�P�� �����	#@�TJU P� H B��Xp�G�r�B`�;*tx �ł,2,�p�IB�����Y:�v�v����C�N}L�@�AvҡOr� k �e2{.��):��3�+��I?�:����5U`��	=*�0b�+$$�Xc3F�D�7vxc �� `  @b� B�/��������/H�8�V<�b�gU��������~W��Lm�j�E|u#)�V�T5�%�"��!z� ����i������-K9=�����lo���U�e/d瘐�	0�J�����RDlQ� �G� �B��x�� 6 PA�'�&p�0�a( $$j��"����I�#�����V2E��-4U?��{��l�DU����#? ��BJP'�"F[ny�Z�iڰ���<�[y�[�QHO�>qC�ސpC�'�X����3,Fh8��A�B�4��#څ@�	@�	'��B�3f�x`��CPa?E#f��O1�gp��Y-��b�f���k�$�R�s�?�����i�EFi��)�����b% �ԿO��,��@��$U��x�do�`�-�������cRf� [���O��P���c@�_�� X�%JD `��!�'v�hW�KPP   6���	 ��!  ��	��aB`a����� !9X�YB�]ſ<�U���DT���xg���U�c���4�'�P۸ �^	 ��͸�&��a��t�6�u������߬a�L���0�]�"]��Pa�=�X�D�#*��|`�H( <�v��ܰ�Ղ)  � +@�"tH�C�6l8�8�PxÆ6��A�ud����9�g��=n�9n��Eu�ZQi�ʓO}º��#��Z�=ZvaW� {M  A��"���?��3}د��5+����?8��'���u�U&-�}3�*��Qz�'���3J,��
9FԀ�^$��3J� J�(������������D  v /X�(���E
	 F� )� ���G�_(`�BCC�C)�*�)X��5��>;x`���$C�8������8�W߁���i�	���	�L`^is����p������}|^��Ϲ	��ʓ��V�u�	5ri8#�pB�_��-6�`�Z�5F��УB�Ĵ���5{����G�\�:   /   ��� �h0�=b��0#�	��C�.�KK�e�ؖ��1M���A�bN_�� ��b
�uQ�RDg5*3b?����ð£E�Sh�w-���v�O�eu����S��(צ�5�m*�F�Bz�-��5j<P`�"jq�5>`�!p�x~?����{�� m 0@ 	�� � >!a �3bH8d� 1b�
��	B�P0@��7���}%�FC%���(� �@&I������K٦���!'�J5�N��"�|O��q�x3_I��3��I��8��O�p� ]`�V�F�
�X"Ǆ;�QbpG��P��@ �����L���1 �� =F��a	�	\�щ@�('���H�H��^S3g>�_�ku~s�����
2�5S;!XB�3�s�A��SU�q9�������ܴ�/��b)��w���qc&��^�'�/]�9S[+�(#r�-f���آB�FѡE	��=�*jc8�k��%�r��  � / ����pC�"Ċ
<np���78Hh� = �,=��"3
����j��G8����ҩ*�mr��6�4��c��eJ�L�|��B��ͥ�oݗc�?2�ue�}�I��[�p�o�p�]
d�=��@��1�À�@ ��,$
 �  �i�� *HK��(a�A��  ��.���j��<�Q��R�P��4k�Sk�y����uKK�)@/������ШR��� 5 �+�o�- b�@4i Ud���y����E�%��?��ח��:>�?�Hk�2��}��q�s�r)r��i�4�P�;�Ȱ�F�!a�9`(�7j�А�֊���v?��
U�E h�&Cx���P`�
�cƂ<z�xbFP#���g �@�.#�䐉�UI6h5�����å_zm,Y
@�b��7c��r�<8[Y
	)�o� �#�"��-��T��:�t#uK����O������]˙�dPB��#6� r�P����P��zx,�АИ���n�\��k�P  ���|ue� ���`0�;� ! ��+<f(����A8 "�ᄰ�9�Q�'&#%��8�[������U�#&�#�16�hЄ�`�fw���:���)�  �o�2j� ����sh��������'OL���7��n�k�ײ[YKSc�?LϦ+��Z�ŀF�8�W���	Kt8�+:Dl�@@b��*ThcYL�*Z ����js�`�I��T  E(Z�x��#~aD�Z��ˀ��`( ��d;jQ1䷡���ڣ��X�߂mb���R���y�U��mt~`P#� 0G  �u� "��x�vNM����u�7�}I����wGִ<q_ə�K�p�'~!ÄzL�Pa�+�(0a�;�x�7�8a�w�5 �(  m��������e �M�zl0 &X�H�B�p( ��-z�	�ԀK �� �),Km���!�PY�ҥ�?߳�嬨5����rXYĢ4���_�*��Ǹ�"@ �#>%|" �/ӎ��2߿��q7�����jI>�)��@I��&���Ti�4E�`�WL�!�zT�P QbB�vȱ@�;��
 ��<2�AX��e�	 ���y�Z6��a�wF9��
 &XX�L���/�hxLH T�� R� XVH/�]L̢��D����������_3�B!)		��(�͎��_;�>Dww��< @
@ �%�@Mo��nL������kE̗RK�t�s�E������{%��T;r@�O\P��'���O$$�Ą%��qE,- ���fwŞ���� ���  �GBҕ �9^��b00��	�+b�8B��/���o86�#`H ��g0w.�\B��ʝ{=�z�zǛ�?W���bW��&�A�T*J�``��o���}�S�;�� �	���"t���w/�����]뿤��:��W.�|�aݷ��ҟV���o]�G����G틪�J�j�N�@�V���;�8`�5��!C�KhT� @r�ؗ�唝+  ˰ ��d�B�+z�\������h��@e
@� �pC�3�E� @� #` 4�=�Y$�`9)i���L��4Z��i��/�>���[y�\��4Q�9,�{�v�܇�w�1Ro�F�#9P�� �:  u� L   ��
b��V�7�_3��]���+�u������.�|w1��ת����.Qᙺ�+ "�#J,�p�5v(PaF@�
5�W4�! a@��%�Ŷǆ=֨�S���?O9��s���, �����o�*D<�N�a` ���������Q��+^݈������9��q>��>�?���^8ᒉ��G�9/q����������_��ŻC��� ! �Q[j
 ��*�� �4�AkF@@� H����8��VQ���~%���-G����������������.N�q��H��ϗ/�����{�����,�m�V�PK�M��DEPRV �8X!q�/�H0��E	��� 1���{< cMM�Dlr��-����������`w�3���JBB����V��!� ��� �,nP� Ԉ����A�#
�p(a�v;4	ɞ����>x��������TI�p��$�t���;�j��>����|w�ff3vSUj�i����B!W���Z3 ���x[ +�7j+f�^��۶k��k��q����ᔇq��{����?��}���'����;)�����������������po�bt}���;,�u�D�3zX�1�@���:��pPbx�@=�}T�x���s�}�y_ٜ���G4p�-��B� ,*Aa����B 
�����������>�
�H2��PV3d��jIE{���D��et;-������ן�����2$MR[��=��vo���<��i��V}W�T�-�P@%jjB��@  tЀ�4p� �kKіyl7��q�ϩ��>�7��7ޛz�jO�w?5~�啞���[yx-��7�?c]�g��܏����e���y��ؿ~;���"���tؑwdXZh,(pG�3R��x��xl�QBbD�#��CcF�Z�8�ӳ����e���4׳((֠^c�7��:��,�3�C��{dhTXPaB�%l����{L��#ŀ?��?��	_��КA�e��h�;�y71'_͒����'�O]����=?�7�9�8�B;��`h�Sj�7Ҽ����+U�$E��d��u�"C�R'HA��pJ���. М@ ��Qh	�f��֎C��w���;�k�r3m�<4�~�|������k?z�j6r,�>�+�ab���K>�������_�e�Ǚ_���n|�����ϕcզi�
g��� �W�c�!��������xd��b�
�I�D5��\弈+��PܽX���y���9�g4zIm0H�!�"DԐ($"f$�
7H�1A@��@� �Ы�RI7IR�\w��K�Q�E:��{�S����[|���rș�,�bl���Ӗ��z]�5��:��'�jW�uVkVq7��4*�5�0�m	�!�Hhz:2Nݖ-�������� ����i�߇��n�wǝ~��}���w�9o��������#���i��:�bO�vz/i�'?��>��W>?�c�~�yI��\�HJӒ%*\����=,,@� ��� �`��"ŊQ�����y_>��4������z[ P�:�ܰ�G��>g���g	�#4,z$t |ǂ�P� (� �Q���D�=&� "D*����Ⱥ��S���	��I��=�<�>O�����������O�J�����3�=U���V�Iy�w��:fu���^Zid'�qu�BUȖ
 s�am L��n��pX9�G;Ʊ#�0�v���Ϲ�;��^����/���ޭ;��?IK�&}X��z�p��q�"ʅ����Rˑ���ӈ����������yt~��?�/�g�9��Ʃ�4�ijrJq� �)ΰ0� 5<V�g�xB����`��
k*�T��i���a�hc���97��(���=Jd,0��+&,(��aP�G
� :d�` !,>�PQ��<ue@��~]>N�7��Z�}��r�mz0fY=��_��L������f���Imi���[v�[V�Y�1�0®yJ�W<�n����YIQ��yt&�ê��ɶ�2�r�[���E�7?�w���Hk�o:^�g�f�6��6���o9��#�u����02�
1��m�{�.�>��>����_�������y����y�k�����w<��I7�����=nd�Oh|8p� ǀ �p�� O�@�A`!�;��	�O���y��ܯ�E��=�ha-�f��J^T�4�B8�8�t(1����
����0#��x E��ݵ��~BH�L�u�(j�M����SDDj�O����/��{�i��k'v���:�ĤLX15z�:����B������J�eJ�6�A�m;���2��ۀ?ȿJݎ;Lq�!�j���XyHƁ�汵{��D1�F #�8��6m�l�Lۇ�w�ۼ~��s��_O�￟_c>t����~�r�m�8jj��<����GN�l�����E�P�	p�8� PC hx(XdP�B�F�<�d���/��t��O��{p�o�  �/g⿏����6j�k���Ψ��� P������?�V�b����a��B���PP���i��*ѣ�B�Ò
}��+��ׅ�T��T�����-������&�;Ia6a&���Bm��f�t�JX� .��	���&t��E�����a�#���r�ٍ�l��M���� �ʱ?���h��2v��b��}Y���lk!�a����w�GR �@Hi.x�?Țc�1̈́@�_ ;���� �I�
5�
#B�H��=b���ܿ��ߎy��ܯI����vn���8��rDZ ���	��1)'<� �B��G	�#V�PH�`A�D9�P��
=�4�"���{LV=7�<����R^t������b���s���6I�OS3��n& ah*�+JSCk"��0���"c��C��VK�h�J�R�,��6��K��˃��@�{��{��?#�g܇�:|L��-]�~�ឬ��Oc�/�r��kn ��uǈ�N�0��c��	� (8� ~���D� �È=�B�b�4x�ٽȜ�����_��33H����6���f��
�;�]�ژ�mG��G�����
T�СPZ���� ��#G��p �P��Q�P�"�@t%��D\35�$��3��f�bN�{�>p����_����q�ǔ�ɒm��1�r:Bi�9���no����8�!]n���!�1����.�����X���=ٿ{?���׏�~���j�y�r_,�ty�}ŭ��K�z��!e�ew��Q�/�����X���!�
5~� ��1A���A�&̘ ��
-Zh�BaX� Ę�z.]��;���7��8J���wY�y��c-H��AX�  ,��34��� �;Zxd� ĈQ�+
4�0(�JxG�	$��,0P|�JÍ*�	�d�I\�,�I�|����8i&�w���l;���󾽔�LҲM�pH<X�}Zth#�y��z�*���9~��ba+s�rm>��R��K9]�Ҩ|>%i\�����U~~���4���e��#��3c^�i�K�Y`�
��^�<�:�8�������45�0#H���C`$��1 �-<4@�h � 3$��x}��  n��U8� ��9�^R�"a� 
=,D\!�a��o��@�1f�� �hq��Fp*E� `@�H�	��~�j�B�Q������^m&��<fڊ02�y$�	�N��:�Dc&49�<�Wfi�O��<���1���D�ʒ|�V�� ��h>Wf�X� ��̝cB�;z�j��Jw@�XやL
8!�F�3*�X�E���,@�
�p��G�;^x U�B)�*�E��� Pi; `u�\��r�T�Z}+"z�5F� 'ܱ�S��иB@��;,���1 ��#$�D�@���5��$�t,j나�fu�6r�Hǂ�E�1;V�42)m$@� ԑB0ӾDlV�rZ9U�j#F]��[�61Y��F#@>K�- dLh�Ȁ\
x�s�7G�ߐ���c�
�
$$|a�X�;|`�*�aa���x@@`@�9r�X&��h @� DHG ���ѴX�h<�и�\w4{��@bEp�B�Z�;R䘐��	����!zĘQ�Cc*C��DI��P[��q�q*�t@���I��u�N>�q�ܠt���p��yJ &2h�pK$2�����k ͩ��,�*M�tF3 �h���(��#j��9��W\�G��9L�"�� ���Oh�W�X��6�P�!ł!�q(Ն}Q;�� xa%$�@!�C.��ya8�Fk�k�l��BRB V��p��@�^M"F��a�p1zx��x�#@�*BbMr�5P�#nIF��R�������.d8�Bԉ1<[wt��]�J)�p�E��-ͺ&4dA�4	5��W��E�Ot�D�@"�nqȁ|������	+��o8 zl��'nH��F�+R��a�Ǆ!V�� V�(�ؙyu�ב�J�2�(׊ڡB�k<�c/�1�E�ǹ-������3� 7E�Uid���ZP��2 ����#Ō3&|�B"E�	�Qb�7�Ф��R|���3�����'*d�"�'�p�#nx V Q���웉�ӌ�P�CD@�	���i|b���ָ`B�	&,0���GlpE��Wt8a��X�R@�jD�Vt�ИB�S6�	*�L�v	�U=�`���m^������+�[��b�5� 6lX]�s�6��%Ec�!��A��x  �  ��!Vxd�!�1�� A(b���'<� "�� ��ƈj4��+�
Wl� ���F�pC���X�-��0"�P��NX�A���+�+��D@�5>Qa��{l��5� 3�1ኄ{4h���v8�
��0 ����KY����ha`��v�a1Ct	Ij	\�[_���x_a�+p�� ��B�%��)Z�h�r��4zuO��|�� (�H�x�#F�c��G��HQ�WH$Ha��!<b��QZ(0<ѣ|B����>�v�R���E�jl0���q��� -j| ^qǈ�1"~����℈�8����J̨p�rl���{��-:���#b4X����A�49A4I�6ζ��
�ۛ�~>�u�8z� ���X�/��Ilȋ���k�`�� 6Ĉ��; �qD�^���;H����1"Ō#b\��;|C�l�G@�=�8a��h��G�fH1���ր/�1#�`�!a�
W���
��"`��	w|"`���Z丢A�_�x`��_X��O��_�7�~��/ ��ʱ�'�� �J֌�+��z��#�� ��{�5 @X���J��<eW��=
x�=�0�0"D�;B���� ��w -$$l�0 �g|����+^0 A@@�=������_�@�pFB4(�>F��p�	9���'�����	WL��E�[���8!ǀ@�?�B�g<��3`7���	<4 � i�K)J��K�ۛ��#�>`f����P 
 �b���x���0Q�\�*sl	 ������B!�)@��7�B�!q�!<v�,�
^�`�Pa�pG�3j���s@�oX�Ō|�\ �0�?�#T���	���X�@�W�P���j�1b�3.(Q�'$��#�x��O��WԐX0�wU H�	>�.c���8^�/�.�.��z��#��03������� [Z� �bYpL;����)�Aq�-�v�֫5	�b�C��Ċ
/��a�����wX
4�B@�� 6 ��QL =Z�
��?A�@( ?C��.�9v�p�.X�;���������
�| �	L������g�8���qA����-�x�O�@��c�1z(�5ru�EP`��X2ḇ�^O���ڥ��	2��޼������w-��ja�va��~��7J!B�V�ǀ3@�fd�P"D�%f�U�X��1"L� A�!�	[�;�hp@�
0bĈS�qB�
{ <���@���wtpF�����{�z$䀄5J\��	~!��0�� %.(1`�3��	[$1�� D�
�b���L����ƽȼ��g֚��㜾�Cr���WT4 ��o��վ�x�5 ��~J� ��-�v��l�"V< ��0���!2���7���!d���Qc�� ���o�&�q,q�0E�5R�|" `�="�x�+��1jtX"""℄�%j���%r��	��P!a@�W��[�� 9�P�G�w|�48 |��a���@�a���ȯ��5������[V�??� ����,��                [remap]

importer="texture"
type="StreamTexture"
path="res://.import/Coin.png-8174b8d78ea9c13f137d9a346c8b9e80.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://util/textures/Coin.png"
dest_files=[ "res://.import/Coin.png-8174b8d78ea9c13f137d9a346c8b9e80.stex" ]

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
GDST@   @            �  WEBPRIFF�  WEBPVP8L�  /?����m��������_"�0@��^�"�v��s�}� �W��<f��Yn#I������wO���M`ҋ���N��m:�
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
GDST�   �            �  WEBPRIFF�  WEBPVP8L�  /��1͘i�Fɛ�A��rTm�*ύ��m���m��m�h�Y���3��8  �����7����gOU#��h���d����ڶm۶mۚ���w���iU�9}���3�����b����$I����ddeVf۶m���7Ҷ=SFwf%#_||�ˣm�n���V��h:{����tr�q�Jmۢ���{��?HE,E������Hr��i����������~��9a|T��P  ?��s[���U�CB�Q �_?A��{��'? H5v�>�X6�A��qّ5�a
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
path="res://.import/weapon.png-28240e62734a0f9c068754a4abac99f9.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://util/textures/weapon.png"
dest_files=[ "res://.import/weapon.png-28240e62734a0f9c068754a4abac99f9.stex" ]

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
          GDST               *   WEBPRIFF   WEBPVP8L   /    ���������            [remap]

importer="texture"
type="StreamTexture"
path="res://.import/white_pixel.png-53a3cef7a4ea877f475dba38bc246c83.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://util/textures/white_pixel.png"
dest_files=[ "res://.import/white_pixel.png-53a3cef7a4ea877f475dba38bc246c83.stex" ]

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
           [remap]

path="res://scripts/arena_full.gdc"
   [remap]

path="res://scripts/periods/card_selection_state.gdc"
 [remap]

path="res://scripts/periods/fight_time.gdc"
           [remap]

path="res://scripts/periods/period_manager.gdc"
       [remap]

path="res://scripts/periods/prep_time.gdc"
            [remap]

path="res://scripts/periods/weapon_attachment_state.gdc"
              [remap]

path="res://scripts/player/fighting_state.gdc"
        [remap]

path="res://scripts/player/movement_input_definition.gdc"
             [remap]

path="res://scripts/player/player.gdc"
[remap]

path="res://scripts/player/player_movement.gdc"
       [remap]

path="res://scripts/player/player_state_machine.gdc"
  �PNG
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
��PA��+@��gA*+�K��ˌ�)S�1��(Ե��ǯ�h����õ�M�`��p�cC�T")�z�j�w��V��@��D��N�^M\����m�zY��C�Ҙ�I����N�Ϭ��{�9�)����o���C���h�����ʆ.��׏(�ҫ���@�Tf%yZt���wg�4s�]f�q뗣�ǆi�l�⵲3t��I���O��v;Z�g��l��l��kAJѩU^wj�(��������{���)�9�T���KrE�V!�D���aw���x[�I��tZ�0Y �%E�͹���n�G�P�"5FӨ��M�K�!>R���$�.x����h=gϝ�K&@-F��=}�=�����5���s �CFwa���8��u?_����D#���x:R!5&��_�]���*�O��;�)Ȉ�@�g�����ou�Q�v���J�G�6�P�������7��-���	պ^#�C�S��[]3��1���IY��.Ȉ!6\K�:��?9�Ev��S]�l;��?/� ��5�p�X��f�1�;5�S�ye��Ƅ���,Da�>�� O.�AJL(���pL�C5ij޿hBƾ���ڎ�)s��9$D�p���I��e�,ə�+;?�t��v�p�-��&����	V���x���yuo-G&8->�xt�t������Rv��Y�4ZnT�4P]�HA�4�a�T�ǅ1`u\�,���hZ����S������o翿���{�릨ZRq��Y��fat�[����[z9��4�U�V��Anb$Kg������]������8�M0(WeU�H�\n_��¹�C�F�F�}����8d�N��.��]���u�,%Z�F-���E�'����q�L�\������=H�W'�L{�BP0Z���Y�̞���DE��I�N7���c��S���7�Xm�/`�	�+`����X_��KI��^��F\�aD�����~�+M����ㅤ��	SY��/�.�`���:�9Q�c �38K�j�0Y�D�8����W;ܲ�pTt��6P,� Nǵ��Æ�:(���&�N�/ X��i%�?�_P	�n�F�.^�G�E���鬫>?���"@v�2���A~�aԹ_[P, n��N������_rƢ��    IEND�B`�       ECFG#      _global_script_classes                    base      Resource      class         MovementInputDefinition       language      GDScript      path   1   res://scripts/player/movement_input_definition.gd               base      Node2D        class         Player        language      GDScript      path      res://scripts/player/player.gd              base      KinematicBody2D       class         PlayerMovement        language      GDScript      path   '   res://scripts/player/player_movement.gd    _global_script_class_iconsh               MovementInputDefinition              Player               PlayerMovement            application/config/name          godot-wild-jam-game-53     application/run/main_scene$         res://arenas/arena_full.tscn    application/boot_splash/bg_color      q�>q�>q�>  �?   application/config/icon$         res://util/textures/icon.png   display/window/size/width      �     display/window/size/height      8     display/window/stretch/mode         2d  +   gui/common/drop_mouse_on_gui_input_disabled            input/wasd_up�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   W      physical_scancode             unicode           echo          script         input/wasd_down�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   S      physical_scancode             unicode           echo          script         input/wasd_left�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   A      physical_scancode             unicode           echo          script         input/wasd_right�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   D      physical_scancode             unicode           echo          script         input/interact�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   E      physical_scancode             unicode           echo          script         input/arrow_left�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        physical_scancode             unicode           echo          script         input/arrow_right�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        physical_scancode             unicode           echo          script         input/arrow_up�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        physical_scancode             unicode           echo          script         input/arrow_down�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        physical_scancode             unicode           echo          script         input/wasd_interact�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   E      physical_scancode             unicode           echo          script         input/wasd_cancel�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   Q      physical_scancode             unicode           echo          script         input/arrow_interact�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   �     physical_scancode             unicode           echo          script         input/arrow_cancel�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   �     physical_scancode             unicode           echo          script         layer_names/2d_render/layer_2         player     layer_names/2d_render/layer_3         weapon     layer_names/2d_render/layer_4         bullet     layer_names/2d_render/layer_5         wall   layer_names/2d_render/layer_6         misc   layer_names/2d_physics/layer_2         player     layer_names/2d_physics/layer_3         weapon     layer_names/2d_physics/layer_4         bullet     layer_names/2d_physics/layer_5         wall   layer_names/2d_physics/layer_6         misc)   physics/common/enable_pause_aware_picking         )   rendering/environment/default_environment(          res://util/envs/default_env.tres