## Create a bucket
'''sh
aws s3 mb s3://prefixes-fun-nb-2468
'''

## Create a folder and put an object
'''sh
aws s3api put-object --bucket "prefixes-fun-nb-2468" --key="lorem/ipsum/dolor/sit/amet/consectetur/adipiscing/elit/in/sed/tortor/non/enim/posuere/fermentum/pellentesque/ut/magna/venenatis/fringilla/odio/vitae/pulvinar/orci/mauris/venenatis/erat/in/risus/aliquam/pharetra/vulputate/urna/tristique/quisque/laoreet/dolor/vitae/maximus/cursus/nisi/mi/vestibulum/ipsum/in/rutrum/tortor/odio/a/ipsum/donec/ultrices/feugiat/leo/luctus/commodo/etiam/id/condimentum/erat/sed/laoreet/pharetra/nulla/nec/feugiat/donec/nec/odio/a/mi/ullamcorper/ultrices/a/quis/sapien/in/eleifend/ante/vel/accumsan/egestas/donec/lacinia/elit/arcu/et/fringilla/nisl/vehicula/ac/morbi/cursus/ante/tincidunt/sapien/sodales/in/ullamcorper/lorem/laoreet/aliquam/varius/lacus/gravida/ornare/faucibus/donec/pretium/dignissim/turpis/vel/varius/donec/nec/tortor/nec/eros/volutpat/facilisis/suspendisse/sit/amet/porta/elit/tempus/rutrum/ipsum/quisque/vehicula/vulputate/orci/ut/ultricies/quam/tincidunt/eu/in/consectetur/ligula/nisi/nulla/facilisi/nullam/tincidunt/leo/at/egestas/dapibus/quis/lorem/ipsum/dolor/sit/amet/co/"
'''

### Try and break the 1024 limit
'''sh
aws s3api put-object --bucket "prefixes-fun-nb-2468" --key="lorem/ipsum/dolor/sit/amet/consectetur/adipiscing/elit/in/sed/tortor/non/enim/posuere/fermentum/pellentesque/ut/magna/venenatis/fringilla/odio/vitae/pulvinar/orci/mauris/venenatis/erat/in/risus/aliquam/pharetra/vulputate/urna/tristique/quisque/laoreet/dolor/vitae/maximus/cursus/nisi/mi/vestibulum/ipsum/in/rutrum/tortor/odio/a/ipsum/donec/ultrices/feugiat/leo/luctus/commodo/etiam/id/condimentum/erat/sed/laoreet/pharetra/nulla/nec/feugiat/donec/nec/odio/a/mi/ullamcorper/ultrices/a/quis/sapien/in/eleifend/ante/vel/accumsan/egestas/donec/lacinia/elit/arcu/et/fringilla/nisl/vehicula/ac/morbi/cursus/ante/tincidunt/sapien/sodales/in/ullamcorper/lorem/laoreet/aliquam/varius/lacus/gravida/ornare/faucibus/donec/pretium/dignissim/turpis/vel/varius/donec/nec/tortor/nec/eros/volutpat/facilisis/suspendisse/sit/amet/porta/elit/tempus/rutrum/ipsum/quisque/vehicula/vulputate/orci/ut/ultricies/quam/tincidunt/eu/in/consectetur/ligula/nisi/nulla/facilisi/nullam/tincidunt/leo/at/egestas/dapibus/quis/lorem/ipsum/dolor/sit/amet/co/hello.txt" --body "hello.txt"
'''

