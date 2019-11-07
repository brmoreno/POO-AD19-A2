import math
import random

for i in range(200):
    bpy.ops.mesh.primitive_cube_add(size = 1,location= (0,0,0))
    obj = bpy.context.active_object
    bpy.context.scene.frame_set(0)
    bpy.ops.anim.keyframe_insert(type = "Rotation")
    bpy.ops.anim.keyframe_insert(type = "Location")

    bpy.context.scene.frame_set(100)
    obj.rotation_euler[0]=random.randrange(6)
    obj.rotation_euler[1]=random.randrange(6)
    obj.rotation_euler[2]=random.randrange(6)
    obj.location[0]= random.randrange(-10,10)
    obj.location[1]= random.randrange(-10,10)
    obj.location[2]= random.randrange(-10,10)
    bpy.ops.anim.keyframe_insert(type = "Rotation")
    bpy.ops.anim.keyframe_insert(type = "Location")
    
