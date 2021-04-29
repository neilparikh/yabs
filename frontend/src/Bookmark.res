@react.component
let make = (~title: string, ~href: string, ~tags: array<string>) => {
  <div className={"p-4 lg:width-1/2 flex flex-row space-x-4"}>
    <div className={"flex flex-col space-y-2"}>
      <svg xmlns="http://www.w3.org/2000/svg" className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={"2"} d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
      </svg>
      <svg xmlns="http://www.w3.org/2000/svg" className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={"2"} d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
      </svg>
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
