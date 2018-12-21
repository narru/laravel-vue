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