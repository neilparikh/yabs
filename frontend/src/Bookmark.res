@react.component
let make = (~title: string, ~href: string, ~tags: array<string>) => {
  <div className={"p-4 lg:width-1/2 flex flex-row space-x-4"}>
    <div className={"flex flex-col space-y-2"}>
      <Heroicons.Pencil className="h-6 w-6" />
      <Heroicons.Trash className="h-6 w-6" />
    </div>
    <div className={"flex flex-col"}>
      <a href className={"text-blue-500"}>{React.string(title)}</a>
      <a href className={"text-gray-500"}>{React.string(href)}</a>
      <div className={"flex space-x-2 flex-wrap"}>
        {Belt.Array.map(tags, tag => {
          <a href={`/t:${tag}`} key={tag} className={"text-yellow-600"}>{React.string(tag)}</a>
        })->React.array}
      </div>
    </div>
  </div>
}
