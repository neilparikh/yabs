@react.component
let make = () => {
  <div className={"md:flex py-8 lg:px-8 lg:w-1/2 flex-col space-y-2 divide-y-4 divide-gray-300"}>
    <Bookmark title={"Neil Parikh"} href={"https://www.neilparikh.me"} tags={["home", "neil", "anotherTag", "yetOneMore", "anotherTag2", "yetOneMore2"]} />
    <Bookmark title={"Github"} href={"https://github.com"} tags={["code", "social"]} />
  </div>
}
