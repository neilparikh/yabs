type editorState = {
  editing: bool,
  title: string,
  href: string
}

module Tag = {
  @react.component
  let make = (~tagName: string) => {
    <a href={`/t:${tagName}`} key={tagName} className={"text-yellow-600"}>{React.string(tagName)}</a>
  }
}


@react.component
let make = (~title: string, ~href: string, ~tags: array<string>, ~onDelete, ~onEdit) => {
  let (editorState, setEditorState) = React.useState(() => { editing: false, title: title, href: href })
  let editingClass = if editorState.editing {
    "text-red-600"
  } else {
    "text-green-600"
  }

  let onEditClick = () => {
    setEditorState(prev => if prev.editing {
      onEdit(prev.title, prev.href, tags)
      { ...prev, editing: false }
    } else {
      { ...prev, editing: true }
    })
  }

  <div className={"p-4 lg:width-1/2 flex flex-row space-x-4"}>
    <div className={"flex flex-col space-y-2"}>
      <Heroicons.Pencil className={`h-6 w-6 fill-current ${editingClass}`} onClick={onEditClick}/>
      <Heroicons.Trash className="h-6 w-6 fill-current" onClick={onDelete} />
    </div>
    <div className={"flex flex-col"}>
      {editorState.editing ? <input className="border-2" type_="text" value={editorState.title} onChange={e => setEditorState(prev => {...prev, title: ReactEvent.Form.target(e)["value"]})} />
                           : <a href className={"text-blue-500 border-2 border-transparent"}>{React.string(title)}</a> }
      {editorState.editing ? <input className="border-2" type_="text" value={editorState.href} onChange={e => setEditorState(prev => {...prev, href: ReactEvent.Form.target(e)["value"]})} />
                           : <a href className={"text-gray-500 border-2 border-transparent"}>{React.string(href)}</a> }

      <div className={"flex space-x-2 flex-wrap"}>
        {Belt.Array.map(tags, tag => {
          <Tag tagName={tag} key={tag} />
        })->React.array}
      </div>
    </div>
  </div>
}
