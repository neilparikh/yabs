// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as Belt_Array from "bs-platform/lib/es6/belt_Array.js";
import TrashIcon from "@heroicons/react/solid/TrashIcon";
import PencilIcon from "@heroicons/react/solid/PencilIcon";

function Bookmark(Props) {
  var title = Props.title;
  var href = Props.href;
  var tags = Props.tags;
  return React.createElement("div", {
              className: "p-4 lg:width-1/2 flex flex-row space-x-4"
            }, React.createElement("div", {
                  className: "flex flex-col space-y-2"
                }, React.createElement(PencilIcon, {
                      className: "h-6 w-6"
                    }), React.createElement(TrashIcon, {
                      className: "h-6 w-6"
                    })), React.createElement("div", {
                  className: "flex flex-col"
                }, React.createElement("a", {
                      className: "text-blue-500",
                      href: href
                    }, title), React.createElement("a", {
                      className: "text-gray-500",
                      href: href
                    }, href), React.createElement("div", {
                      className: "flex space-x-2 flex-wrap"
                    }, Belt_Array.map(tags, (function (tag) {
                            return React.createElement("a", {
                                        key: tag,
                                        className: "text-yellow-600",
                                        href: "/t:" + tag
                                      }, tag);
                          })))));
}

var make = Bookmark;

export {
  make ,
  
}
/* react Not a pure module */
