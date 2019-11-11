import bpy
import bmesh
import random

bpy.ops.mesh.primitive_ico_sphere_add(radius = 1, location=(0,0,0))
bpy.ops.object.mode_set(mode = 'EDIT')
bpy.ops.mesh.select_all(action = 'DESELECT')
print(bpy.context.object.data)
bm = bmesh.from_edit_mesh(bpy.context.object.data)
bm.faces.ensure_lookup_table()

#for i in range(len(bm.faces)):
#    bm.faces[i].select = True
    #bpy.ops.transform.translate(value = (random.random()*0.3,random.random()*0.3,random.random()*0.3))
    #bpy.ops.transform.rotate(value = random.random()*0.5, orient_axis = 'X')
    #bpy.ops.transform.rotate(value = random.random()*0.5, orient_axis = 'Y')
    #bpy.ops.transform.rotate(value = random.random()*0.5, orient_axis = 'Z')
#    bpy.ops.transform.resize(value=(1+random.random()*0.5,1+random.random()*0.5,1+random.random()*0.5))
#    bm.faces[i].select = False

bm.faces[1].select = True
print(bm.faces[1])
bpy.ops.transform.shrink_fatten(value = 1)
