from invoke import Collection

import build
import dev

ns = Collection()
ns.add_collection(Collection.from_module(build, name="build"))
ns.add_collection(Collection.from_module(dev, name="dev"))
