import bmesh
import random

bpy.ops.mesh.primitive_ico_sphere_add(radius = 1, location=(0,0,0))
bpy.ops.object.mode_set(mode = 'EDIT')
bpy.ops.mesh.select_all(action = 'DESELECT')
print(bpy.context.object.data)
bm = bmesh.from_edit_mesh(bpy.context.object.data)
bm.faces.ensure_lookup_table()

for i in range(len(bm.faces)):
    bm.faces.ensure_lookup_table()
    bm.faces[i].select = True
    posor= bm.faces[i].calc_center_median_weighted()
    bpy.ops.mesh.extrude_region_move(TRANSFORM_OT_translate= {'value':posor*1})
    bpy.ops.transform.resize(value= (0.1,0.1,0.1))
    bpy.ops.mesh.extrude_region_move(TRANSFORM_OT_translate= {'value':posor*0.2})
    bpy.ops.transform.resize(value= (15.3,15.3,15.3))
    bpy.ops.mesh.select_all(action = 'DESELECT')
