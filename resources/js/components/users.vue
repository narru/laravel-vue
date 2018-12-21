<template>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="card mt-5">
                <div class="card-header">
                    <h3 class="card-title">User Table</h3>
                    <div class="card-tools">
                        <button class="btn btn-md btn-success" v-on:click="newModal">Add New  <i class="fas fa-user-plus"></i></button>
                    </div>
                </div>
                <!-- /.card-header -->
                <div class="card-body table-responsive p-0">
                    <table class="table table-hover">
                        <tbody>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>E-mail</th>
                                <th>Type</th>
                                <th>Created at</th>
                                <th>Action</th>
                            </tr>
                            <tr v-for="user in users" :key="user.id">
                                <td>{{ user.id }}</td>
                                <td>{{ user.name }}</td>
                                <td>{{ user.email }}</td>
                                <td>{{ user.type | capitalize }}</td>
                                <td>{{ user.created_at | myDate }}</td>
                                <td>
                                    <a v-on:click="editModal(user)" class="btn btn-sm btn-success"><i class="fas fa-edit"></i></a>

                                    <a v-on:click="showModal(user)" class="btn btn-sm btn-info"><i class="fas fa-eye"></i></a>

                                    <a v-on:click="deleteUser(user.id)" class="btn btn-sm btn-danger text-white"><i class="fas fa-trash-alt"></i></a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div>
    </div>
    <!-- model for add user -->
    <div class="modal fade" id="addNew" tabindex="-1" role="dialog" aria-labelledby="addNewLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 v-show="!editmode" class="modal-title" id="addNewLabel">Add New User</h5>
                    <h5 v-show="editmode" class="modal-title" id="addNewLabel">Edit User</h5> 
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form @submit.prevent="editmode ? updateUser() : createUser()">
                    <div class="modal-body">
                        <div class="form-group">
                            <input v-model="form.name" type="text" name="name"
                            class="form-control" :class="{ 'is-invalid': form.errors.has('name') }" placeholder="Name">
                            <has-error :form="form" field="name"></has-error>
                        </div>
                        <div class="form-group">
                            <input v-model="form.email" type="email" name="email"
                            class="form-control" :class="{ 'is-invalid': form.errors.has('email') }" placeholder="Email">
                            <has-error :form="form" field="email"></has-error>
                        </div>
                        <div class="form-group">
                            <textarea v-model="form.bio" type="bio" name="bio"
                            class="form-control" :class="{ 'is-invalid': form.errors.has('bio') }" placeholder="Bio" rows="5"></textarea>
                            <has-error :form="form" field="bio"></has-error>
                        </div>
                        <div class="form-group">
                            <select v-model="form.type" name="type" id="type" 
                            class="form-control" :class="{ 'is-invalid': form.errors.has('type') }">
                                <option value="">Select User Role</option>
                                <option value="admin">Admin</option>
                                <option value="user">User</option>
                                <option value="author">Author</option>
                            </select>
                            <has-error :form="form" field="type"></has-error>
                        </div>
                        <div v-show="!editmode" class="form-group">
                            <input v-model="form.password" type="password" name="password"
                            class="form-control" :class="{ 'is-invalid': form.errors.has('password') }">
                            <has-error :form="form" field="password"></has-error>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <!-- checking condition for edit mode is on or not -->
                        <button v-show="!editmode" type="submit" class="btn btn-primary">Create</button>
                        <button v-show="editmode" type="submit" class="btn btn-primary">Update</button>
                        <!-- end the edit mode -->
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- end of the add user model -->
    <!-- start edit model for user -->
    <div class="modal fade" id="showUser" tabindex="-1" role="dialog" aria-labelledby="showUserLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="showUserLabel">Add New User</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form @submit.prevent="viewUser">
                    <div class="modal-body">
                        <div class="form-group">
                            <input v-model="form.name" type="text" name="name" value="" 
                            class="form-control" :class="{ 'is-invalid': form.errors.has('name') }" placeholder="Name" disabled>
                            <has-error :form="form" field="name"></has-error>
                        </div>
                        <div class="form-group">
                            <input v-model="form.email" type="email" name="email" value="" 
                            class="form-control" :class="{ 'is-invalid': form.errors.has('email') }" placeholder="Email" disabled>   
                        </div>
                        <div class="form-group">
                            <textarea v-model="form.bio" type="bio" name="bio"
                            class="form-control" :class="{ 'is-invalid': form.errors.has('bio') }" placeholder="Bio" rows="5" disabled></textarea>
                            <has-error :form="form" field="bio"></has-error>
                        </div>
                        <div class="form-group">
                            <input v-model="form.type" type="text" name="type"
                            class="form-control" :class="{ 'is-invalid': form.errors.has('type') }" placeholder="type" disabled>
                            <has-error :form="form" field="bio"></has-error>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- end of the user model -->
</div>
</template>

<script>
    export default {
            data () {
            return {
                editmode: true,
                users: {},
                  // Create a new form instance
                  form: new Form({
                    id: '',
                    name: '',
                    email:'',
                    type:'',
                    bio:'',
                    photo:'',
                    password: ''
                  })
            }
      }, 
      methods: {
        showModal(user){
            $('#showUser').modal('show');
            this.form.fill(user);
        },
        updateUser(id) {
            this.$Progress.start();
                this.form.put('api/user/'+ this.form.id)
                    .then(()=>{
                        // success
                        $('#addNew').modal('hide');
                        Fire.$emit('AfterCreate');
                        toast({
                          type: 'success',
                          title: 'user Updated successfully'
                        })
                    })
                    .catch(()=>{
                    })
            this.$Progress.finish();

        },
        editModal(user) {
            this.editmode = true;
                $('#addNew').modal('show');
            this.form.fill(user);
        },
        newModal() {
            this.editmode = false;
                this.form.reset();
            $('#addNew').modal('show');

        },
        deleteUser(id) {
            swal({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    // send request to serve
                    if (result.value) {
                        this.form.delete('api/user/'+ id).then(()=>{      
                                    swal(
                                      'Deleted!',
                                      'Your file has been deleted.',
                                      'success'
                                    )
                        Fire.$emit('AfterCreate');
                        }).catch(()=>{
                            swal("Failed!","There Was Something Wrong.","warning");
                        });
                    }
                })

        },
        loadUsers(){
            axios.get("api/user").then(({ data }) => (this.users = data.data));
        },
        createUser(){
            this.$Progress.start();
            this.form.post('api/user')
            .then(()=> {    
                Fire.$emit('AfterCreate');
                $('#addNew').modal('hide');
                toast({
                  type: 'success',
                  title: 'User Created successfully'
                });
            this.$Progress.start();
                this.$Progress.finish();
            })
            .catch(()=> {

            })
        }
      },
        created() {
            this.loadUsers();
            Fire.$on('AfterCreate',()=> {
                this.loadUsers();
            });
            // setInterval(() => this.loadUsers(), 3000);
        }
    }
   
</script>
