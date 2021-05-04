module Pencil = {
  @bs.module("@heroicons/react/solid/PencilIcon") @react.component
  external make: (
    ~className: string,
    ~onClick: option<() => ()>=?
  ) => React.element = "default"
}

module Trash = {
  @bs.module("@heroicons/react/solid/TrashIcon") @react.component
  external make: (
    ~className: string,
    ~onClick: option<() => ()>=?
  ) => React.element = "default"
}
