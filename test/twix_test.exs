defmodule TwixTest do
  use ExUnit.Case
  import Twix

  doctest Twix

  test "simplest example" do
    assert tw(
             "container bg-fixed bg-clip-padding fixed bg-gray-500 hover:bg-red-250 container static bg-clip-border bg-scroll"
           ) ==
             "bg-gray-500 hover:bg-red-250 container static bg-clip-border bg-scroll"
  end

  test "passing classes as a list" do
    assert tw([
             "container bg-fixed",
             "bg-clip-padding fixed",
             "bg-gray-500",
             "hover:bg-red-250",
             "container static bg-clip-border",
             "bg-scroll"
           ]) ==
             "bg-gray-500 hover:bg-red-250 container static bg-clip-border bg-scroll"
  end

  test "unknown classes should just fall through as-is" do
    assert tw("container bg-gray-500 bg-red-300 asdf-300 foobar") == "container bg-red-300 asdf-300 foobar"
  end

  test "modifiers" do
    assert tw("focus-within:inline focus-within:block") == "focus-within:block"
  end

  test "aspect" do
    assert tw("aspect-auto bg-red-500 aspect-[4/3]") == "bg-red-500 aspect-[4/3]"
  end

  test "columns" do
    assert tw("columns-3 columns-lg") == "columns-lg"
  end

  test "break-after" do
    assert tw("break-after-all bg-red-500 break-after-page") == "bg-red-500 break-after-page"
  end

  test "break-before" do
    assert tw("break-before-all bg-red-500 break-before-page") == "bg-red-500 break-before-page"
  end

  test "break-inside" do
    assert tw("break-inside-auto bg-red-500 break-before-all break-inside-avoid-page") ==
             "bg-red-500 break-before-all break-inside-avoid-page"
  end

  test "box-decoration" do
    assert tw("box-decoration-clone bg-red-500 box-decoration-slice") ==
             "bg-red-500 box-decoration-slice"
  end

  test "box" do
    assert tw("box-content box-decoration-clone bg-red-500 box-border") ==
             "box-decoration-clone bg-red-500 box-border"
  end

  test "display" do
    assert tw("table bg-red-500 inline-flex block") == "bg-red-500 block"
  end

  test "float" do
    assert tw("float-right bg-red-500 float-none") == "bg-red-500 float-none"
  end

  test "clear" do
    assert tw("clear-left bg-red-500 clear-right") == "bg-red-500 clear-right"
  end

  test "isolation" do
    assert tw("isolate bg-red-500 isolation-auto") == "bg-red-500 isolation-auto"
  end

  test "object-fit" do
    assert tw("object-cover bg-red-500 object-scale-down") == "bg-red-500 object-scale-down"
  end

  test "object-position" do
    assert tw("object-bottom bg-red-500 object-top") == "bg-red-500 object-top"

    assert tw("object-top bg-red-500 object-[center_bottom]") ==
             "bg-red-500 object-[center_bottom]"
  end

  test "overflow" do
    assert tw("overflow-scroll bg-red-500 overflow-auto") == "bg-red-500 overflow-auto"
  end

  test "overflow-x" do
    assert tw("overflow-x-scroll bg-red-500 overflow-auto overflow-x-visible") ==
             "bg-red-500 overflow-auto overflow-x-visible"
  end

  test "overflow-y" do
    assert tw("overflow-y-scroll bg-red-500 overflow-auto overflow-y-visible") ==
             "bg-red-500 overflow-auto overflow-y-visible"
  end

  test "overscroll" do
    assert tw("overscroll-none bg-red-500 overscroll-auto") == "bg-red-500 overscroll-auto"
  end

  test "overscroll-x" do
    assert tw("overscroll-x-none bg-red-500 overscroll-x-auto") == "bg-red-500 overscroll-x-auto"
  end

  test "overscroll-y" do
    assert tw("overscroll-y-none bg-red-500 overscroll-y-auto") == "bg-red-500 overscroll-y-auto"
  end

  test "inset" do
    assert tw("inset-auto bg-red-500 inset-[3px]") == "bg-red-500 inset-[3px]"
  end

  test "inset-x" do
    assert tw("inset-x-auto bg-red-500 inset-x-[3px]") == "bg-red-500 inset-x-[3px]"
  end

  test "inset-y" do
    assert tw("inset-y-auto bg-red-500 inset-y-[3px]") == "bg-red-500 inset-y-[3px]"
  end

  test "top" do
    assert tw("top-auto bg-red-500 top-[3px]") == "bg-red-500 top-[3px]"
  end

  test "right" do
    assert tw("right-auto bg-red-500 right-[3px]") == "bg-red-500 right-[3px]"
  end

  test "bottom" do
    assert tw("bottom-auto bg-red-500 bottom-[3px]") == "bg-red-500 bottom-[3px]"
  end

  test "left" do
    assert tw("left-auto bg-red-500 left-[3px]") == "bg-red-500 left-[3px]"
  end

  test "visibility" do
    assert tw("collapse bg-red-500 visible") == "bg-red-500 visible"
  end

  test "z" do
    assert tw("z-1 bg-red-500 z-2") == "bg-red-500 z-2"
  end

  test "basis" do
    assert tw("basis-2.5 bg-red-500 basis-3/5") == "bg-red-500 basis-3/5"
  end

  test "flex-direction" do
    assert tw("flex-row bg-red-500 flex-wrap flex-col") == "bg-red-500 flex-wrap flex-col"
  end

  test "flex-wrap" do
    assert tw("flex-wrap flex-wrap-reverse bg-red-500") == "flex-wrap-reverse bg-red-500"
  end

  test "flex" do
    assert tw("flex-auto flex-none flex-1 bg-red-500") == "flex-1 bg-red-500"
  end

  test "grow" do
    assert tw("grow bg-red-500 grow-0") == "bg-red-500 grow-0"
  end

  test "shrink" do
    assert tw("shrink bg-red-500 shrink-0") == "bg-red-500 shrink-0"
  end

  test "order" do
    assert tw("order-last order-2") == "order-2"
  end

  test "grid-cols" do
    assert tw("grid-cols-7 grid-cols-none") == "grid-cols-none"
  end

  test "col-start-end" do
    assert tw("col-auto col-span-2 col-span-full") == "col-span-full"
  end

  test "col-start" do
    assert tw("col-start-auto col-start-5") == "col-start-5"
  end

  test "col-end" do
    assert tw("col-end-5 col-end-auto") == "col-end-auto"
  end

  test "grid-rows" do
    assert tw("grid-cols-none grid-cols-4") == "grid-cols-4"
  end

  test "row-start-end" do
    assert tw("row-span-full row-auto") == "row-auto"
  end

  test "row-start" do
    assert tw("row-start-5 row-start-auto") == "row-start-auto"
  end

  test "row-end" do
    assert tw("row-end-5 row-end-auto") == "row-end-auto"
  end

  test "grid-flow" do
    assert tw("grid-flow-col grid-flow-row") == "grid-flow-row"
  end

  test "auto-cols" do
    assert tw("auto-cols-min auto-cols-fr") == "auto-cols-fr"
  end

  test "auto-rows" do
    assert tw("auto-rows-min auto-rows-fr") == "auto-rows-fr"
  end

  test "gap" do
    assert tw("gap-2 gap-px gap-0.5") == "gap-0.5"
  end

  test "gap-x" do
    assert tw("gap-x-2 gap-x-px gap-x-0.5") == "gap-x-0.5"
  end

  test "gap-y" do
    assert tw("gap-y-2 gap-y-px gap-y-0.5") == "gap-y-0.5"
  end

  test "justify-content" do
    assert tw("justify-start justify-end justify-around") == "justify-around"
  end

  test "justify-items" do
    assert tw("justify-items-start justify-items-end justify-items-stretch justify-items-center") ==
             "justify-items-center"
  end

  test "justify-self" do
    assert tw("justify-self-auto justify-self-center") == "justify-self-center"
  end

  test "align-content" do
    assert tw("align-content-baseline align-content-center") == "align-content-center"
  end

  test "align-items" do
    assert tw("items-start items-baseline") == "items-baseline"
  end

  test "align-self" do
    assert tw("self-start self-auto") == "self-auto"
  end

  test "place-content" do
    assert tw("place-content-baseline place-content-stretch place-content-center") ==
             "place-content-center"
  end

  test "place-items" do
    assert tw("place-items-end place-items-stretch") == "place-items-stretch"
  end

  test "place-self" do
    assert tw("place-self-center place-self-auto") == "place-self-auto"
  end

  test "p" do
    assert tw("p-px p-0.5") == "p-0.5"
  end

  test "px" do
    assert tw("px-px px-0.5") == "px-0.5"
  end

  test "py" do
    assert tw("py-px py-0.5") == "py-0.5"
  end

  test "pt" do
    assert tw("pt-px pt-0.5") == "pt-0.5"
  end

  test "pr" do
    assert tw("pr-px pr-0.5") == "pr-0.5"
  end

  test "pb" do
    assert tw("pb-px pb-0.5") == "pb-0.5"
  end

  test "pl" do
    assert tw("pl-px pl-0.5") == "pl-0.5"
  end

  test "m" do
    assert tw("m-px m-0.5") == "m-0.5"
  end

  test "mx" do
    assert tw("mx-px mx-0.5") == "mx-0.5"
  end

  test "my" do
    assert tw("my-px my-0.5") == "my-0.5"
  end

  test "mt" do
    assert tw("mt-px mt-0.5") == "mt-0.5"
  end

  test "mr" do
    assert tw("mr-px mr-0.5") == "mr-0.5"
  end

  test "mb" do
    assert tw("mb-px mb-0.5") == "mb-0.5"
  end

  test "ml" do
    assert tw("ml-px ml-0.5") == "ml-0.5"
  end

  test "space-x" do
    assert tw("space-x-0 space-x-0.5") == "space-x-0.5"
  end

  test "space-x-reverse" do
    assert tw("space-x-reverse space-x-1 space-x-reverse") == "space-x-1 space-x-reverse"
  end

  test "space-y" do
    assert tw("space-y-1 space-y-1.5") == "space-y-1.5"
  end

  test "space-y-reverse" do
    assert tw("space-y-reverse space-y-1 space-y-reverse") == "space-y-1 space-y-reverse"
  end

  test "w" do
    assert tw("w-min w-4 w-fit") == "w-fit"
  end

  test "min-w" do
    assert tw("min-w-min min-w-fit") == "min-w-fit"
  end

  test "max-w" do
    assert tw("max-w-0 max-w-full max-w-[50%]") == "max-w-[50%]"
    assert tw("max-w-[50%] max-w-md") == "max-w-md"
  end

  test "h" do
    assert tw("h-min h-4 h-fit") == "h-fit"
  end

  test "min-h" do
    assert tw("min-h-2 min-h-fit") == "min-h-fit"
  end

  test "max-h" do
    assert tw("max-h-2 max-h-fit") == "max-h-fit"
  end

  test "font-size" do
    assert tw("text-xs text-lg text-base text-9xl") == "text-9xl"
    assert tw("text-sm text-[14px]") == "text-[14px]"
  end

  test "font-smoothing" do
    assert tw("subpixel-antialiased antialiased") == "antialiased"
  end

  test "font-style" do
    assert tw("italic not-italic") == "not-italic"
  end

  test "font-weight" do
    assert tw("font-[1100] font-semibold") == "font-semibold"
  end

  test "font-family" do
    assert tw("font-sans font-semibold font-serif") == "font-semibold font-serif"
  end

  test "fvn-spacing" do
    assert tw("proportional-nums tabular-nums") == "tabular-nums"
  end

  test "fvn-fraction" do
    assert tw("diagonal-fractions stacked-fractions") ==
             "stacked-fractions"
  end

  test "tracking" do
    assert tw("tracking-tight tracking-wide") == "tracking-wide"
  end

  test "leading" do
    assert tw("leading-none leading-tight leading-loose") == "leading-loose"
  end

  test "list-style-type" do
    assert tw("list-none list-[upper-roman] list-disc list-decimal") == "list-decimal"
  end

  test "list-style-position" do
    assert tw("list-inside list-outside") == "list-outside"
  end

  test "placeholder-opacity" do
    assert tw("placeholder-opacity-5 placeholder-opacity-6") == "placeholder-opacity-6"
  end

  test "text-alignment" do
    assert tw("text-left text-center text-right text-justify text-start text-end") == "text-end"
  end

  test "text-color" do
    assert tw("text-red-500 text-blue-300") == "text-blue-300"
  end

  test "text-opacity" do
    assert tw("text-opacity-50 text-opacity-25") == "text-opacity-25"
  end

  test "text-decoration" do
    assert tw("underline overline line-through no-underline") == "no-underline"
  end

  test "text-decoration-style" do
    assert tw(
             "decoration-solid decoration-dashed decoration-dotted decoration-double decoration-none"
           ) == "decoration-none"
  end

  test "text-decoration-thickness" do
    assert tw("decoration-auto decoration-from-font decoration-2 decoration-[3px]") ==
             "decoration-[3px]"
  end

  test "underline-offset" do
    assert tw("underline-offset-auto underline-offset-0 underline-offset-[3px]") ==
             "underline-offset-[3px]"
  end

  test "text-decoration-color" do
    assert tw("decoration-red-500 decoration-blue-300") == "decoration-blue-300"
  end

  test "text-transform" do
    assert tw("uppercase lowercase capitalize normal-case") == "normal-case"
  end

  test "text-overflow" do
    assert tw("truncate text-ellipsis text-clip") == "text-clip"
  end

  test "indent" do
    assert tw("indent-0 indent-px indent-1") == "indent-1"
  end

  test "vertical-align" do
    assert tw(
             "align-baseline align-top align-middle align-bottom align-text-top align-text-bottom"
           ) == "align-text-bottom"
  end

  test "whitespace" do
    assert tw(
             "whitespace-normal whitespace-nowrap whitespace-pre whitespace-pre-line whitespace-pre-wrap"
           ) == "whitespace-pre-wrap"
  end

  test "break" do
    assert tw("break-normal break-words break-all break-keep") == "break-keep"
  end

  test "content" do
    assert tw("content-none content-['Howdy']") == "content-['Howdy']"
  end

  test "bg-attachment" do
    assert tw("bg-fixed bg-local bg-scroll") == "bg-scroll"
  end

  test "bg-clip" do
    assert tw("bg-clip-border bg-clip-padding bg-clip-content bg-clip-text") == "bg-clip-text"
  end

  test "bg-opacity" do
    assert tw("bg-opacity-25 bg-opacity-50") == "bg-opacity-50"
  end

  test "bg-origin" do
    assert tw("bg-origin-border bg-origin-padding bg-origin-content") == "bg-origin-content"
  end

  test "bg-position" do
    assert tw("bg-bottom bg-top") == "bg-top"
  end

  test "bg-repeat" do
    assert tw("bg-repeat bg-no-repeat bg-repeat-x bg-repeat-y bg-repeat-round bg-repeat-space") ==
             "bg-repeat-space"
  end

  test "bg-size" do
    assert tw("bg-auto bg-cover bg-contain bg-[length:200px_100px]") == "bg-[length:200px_100px]"
  end

  test "bg-image" do
    assert tw("bg-none bg-gradient-to-t bg-gradient-to-tr") == "bg-gradient-to-tr"
  end

  test "bg-color" do
    assert tw("bg-inherit bg-current bg-transparent bg-black bg-white bg-slate-50 bg-red-200") ==
             "bg-red-200"
  end

  test "gradient-from" do
    assert tw(
             "from-inherit from-current from-transparent from-black from-white from-red-50 from-slate-200"
           ) == "from-slate-200"
  end

  test "gradient-via" do
    assert tw("via-inherit via-current via-black via-red-50 via-indigo-500") == "via-indigo-500"
  end

  test "gradient-to" do
    assert tw("to-inherit to-current to-black to-red-50 to-indigo-700") == "to-indigo-700"
  end

  test "rounded" do
    assert tw("rounded rounded-none rounded-full rounded-xl rounded-sm rounded-[3px]") ==
             "rounded-[3px]"
  end

  test "rounded-t" do
    assert tw("rounded-t rounded-t-none rounded-t-full rounded-t-xl rounded-t-sm rounded-t-[3px]") ==
             "rounded-t-[3px]"
  end

  test "rounded-r" do
    assert tw("rounded-r rounded-r-none rounded-r-full rounded-r-xl rounded-r-sm rounded-r-[3px]") ==
             "rounded-r-[3px]"
  end

  test "rounded-b" do
    assert tw("rounded-b rounded-b-none rounded-b-full rounded-b-xl rounded-b-sm rounded-b-[3px]") ==
             "rounded-b-[3px]"
  end

  test "rounded-l" do
    assert tw("rounded-l rounded-l-none rounded-l-full rounded-l-xl rounded-l-sm rounded-l-[3px]") ==
             "rounded-l-[3px]"
  end

  test "rounded-tl" do
    assert tw(
             "rounded-tl rounded-tl-none rounded-tl-full rounded-tl-xl rounded-tl-sm rounded-tl-[3px]"
           ) == "rounded-tl-[3px]"
  end

  test "rounded-tr" do
    assert tw(
             "rounded-tr rounded-tr-none rounded-tr-full rounded-tr-xl rounded-tr-sm rounded-tr-[3px]"
           ) == "rounded-tr-[3px]"
  end

  test "rounded-br" do
    assert tw(
             "rounded-br rounded-br-none rounded-br-full rounded-br-xl rounded-br-sm rounded-br-[3px]"
           ) == "rounded-br-[3px]"
  end

  test "rounded-bl" do
    assert tw(
             "rounded-bl rounded-bl-none rounded-bl-full rounded-bl-xl rounded-bl-sm rounded-bl-[3px]"
           ) == "rounded-bl-[3px]"
  end

  test "border-w" do
    assert tw("border border-2 border-4") == "border-4"
  end

  test "border-w-x" do
    assert tw("border-x border-x-2 border-x-4") == "border-x-4"
  end

  test "border-w-y" do
    assert tw("border-y border-y-2 border-y-4") == "border-y-4"
  end

  test "border-w-t" do
    assert tw("border-t border-t-2 border-t-4") == "border-t-4"
  end

  test "border-w-r" do
    assert tw("border-r border-r-2 border-r-4") == "border-r-4"
  end

  test "border-w-b" do
    assert tw("border-b border-b-2 border-b-4") == "border-b-4"
  end

  test "border-w-l" do
    assert tw("border-l border-l-2 border-l-4") == "border-l-4"
  end

  test "border-opacity" do
    assert tw("border-opacity-25 border-opacity-50") == "border-opacity-50"
  end

  test "border-style" do
    assert tw("border-solid border-hidden border-dashed border-dotted border-double border-none") ==
             "border-none"
  end

  test "divide-x" do
    assert tw("divide-x divide-x-2 divide-x-4 divide-x-[3px]") == "divide-x-[3px]"
  end

  test "divide-x-reverse" do
    assert tw("divide-x divide-x-reverse divide-x-2") == "divide-x-reverse divide-x-2"
  end

  test "divide-y" do
    assert tw("divide-y divide-y-2 divide-y-4 divide-y-[3px]") == "divide-y-[3px]"
  end

  test "divide-y-reverse" do
    assert tw("divide-y divide-y-reverse divide-y-2") == "divide-y-reverse divide-y-2"
  end

  test "divide-opacity" do
    assert tw("divide-opacity-25 divide-opacity-50") == "divide-opacity-50"
  end

  test "divide-style" do
    assert tw("divide-solid divide-dashed divide-dotted divide-double divide-none") ==
             "divide-none"
  end

  test "border-color" do
    assert tw("border-blue-300 border-red-300 border-red-200") == "border-red-200"
  end

  test "border-color-x" do
    assert tw("border-x-blue-300 border-x-red-300 border-x-red-200") == "border-x-red-200"
  end

  test "border-color-y" do
    assert tw("border-y-blue-300 border-y-red-300 border-y-red-200") == "border-y-red-200"
  end

  test "border-color-t" do
    assert tw("border-t-blue-300 border-t-red-300 border-t-red-200") == "border-t-red-200"
  end

  test "border-color-r" do
    assert tw("border-r-blue-300 border-r-red-300 border-r-red-200") == "border-r-red-200"
  end

  test "border-color-b" do
    assert tw("border-b-blue-300 border-b-red-300 border-b-red-200") == "border-b-red-200"
  end

  test "border-color-l" do
    assert tw("border-l-blue-300 border-l-red-300 border-l-red-200") == "border-l-red-200"
  end

  test "divide-color" do
    assert tw("divide-blue-300 divide-red-300 divide-red-200") == "divide-red-200"
  end

  test "outline-style" do
    assert tw("outline outline-solid outline-dashed outline-dotted outline-double outline-none") ==
             "outline-none"
  end

  test "outline-offset" do
    assert tw("outline-offset-0 outline-offset-2 outline-offset-4") == "outline-offset-4"
  end

  test "outline-w" do
    assert tw("outline-0 outline-2 outline-4") == "outline-4"
  end

  test "outline-color" do
    assert tw("outline-blue-300 outline-red-300 outline-red-200") == "outline-red-200"
  end

  test "ring-w" do
    assert tw("ring ring-0 ring-2") == "ring-2"
  end

  test "ring-w-inset" do
    assert tw("ring ring-inset") == "ring ring-inset"
  end

  test "ring-color" do
    assert tw("ring-blue-300 ring-red-300 bg-red-100 ring-red-200") == "bg-red-100 ring-red-200"
  end

  test "ring-opacity" do
    assert tw("ring-opacity-0 ring-blue-200 ring-opacity-2") == "ring-blue-200 ring-opacity-2"
  end

  test "ring-offset-w" do
    assert tw("ring-offset-0 ring-offset-2") == "ring-offset-2"
  end

  test "ring-offset-color" do
    assert tw("ring-offset-blue-300 ring-offset-red-300") == "ring-offset-red-300"
  end

  test "shadow" do
    assert tw("shadow shadow-inner shadow-none shadow-sm shadow-md") == "shadow-md"
  end

  test "shadow-color" do
    assert tw("shadow-blue-300 shadow-red-300") == "shadow-red-300"
  end

  test "opacity" do
    assert tw("bg-fixed bg-opacity-50 bg-red-500 bg-opacity-70") ==
             "bg-fixed bg-red-500 bg-opacity-70"
  end

  test "mix-blend" do
    assert tw("mix-blend-normal mix-blend-multiply mix-blend-overlay") == "mix-blend-overlay"
  end

  test "bg-blend" do
    assert tw("bg-blend-normal bg-blend-multiply bg-blend-overlay") == "bg-blend-overlay"
  end

  test "filter" do
    assert tw("filter filter-none") == "filter-none"
  end

  test "blur" do
    assert tw("blur blur-none blur-md blur-sm") == "blur-sm"
  end

  test "brightness" do
    assert tw("brightness-0 brightness-2 brightness-4") == "brightness-4"
  end

  test "contrast" do
    assert tw("contrast-0 contrast-2 contrast-4") == "contrast-4"
  end

  test "drop-shadow" do
    assert tw("drop-shadow drop-shadow-none drop-shadow-md") == "drop-shadow-md"
  end

  test "grayscale" do
    assert tw("grayscale grayscale-0") == "grayscale-0"
  end

  test "hue-rotate" do
    assert tw("hue-rotate-0 hue-rotate-2 hue-rotate-4") == "hue-rotate-4"
  end

  test "invert" do
    assert tw("invert invert-0")
  end

  test "saturate" do
    assert tw("saturate-0 saturate-2 saturate-4") == "saturate-4"
  end

  test "sepia" do
    assert tw("sepia sepia-0") == "sepia-0"
  end

  test "backdrop-filter" do
    assert tw("backdrop-filter backdrop-filter-none") == "backdrop-filter-none"
  end

  test "backdrop-blur" do
    assert tw("backdrop-blur backdrop-blur-none backdrop-blur-sm") == "backdrop-blur-sm"
  end

  test "backdrop-brightness" do
    assert tw("backdrop-brightness-0 backdrop-brightness-2") == "backdrop-brightness-2"
  end

  test "backdrop-contrast" do
    assert tw("backdrop-contrast-2 backdrop-contrast-4") == "backdrop-contrast-4"
  end

  test "backdrop-saturate" do
    assert tw("backdrop-saturate-2 backdrop-saturate-4") == "backdrop-saturate-4"
  end

  test "backdrop-sepia" do
    assert tw("backdrop-sepia-0 backdrop-sepia") == "backdrop-sepia"
  end

  test "border-collapse" do
    assert tw("border-collapse border-separate") == "border-separate"
  end

  test "border-spacing" do
    assert tw("border-spacing-0 border-spacing-2") == "border-spacing-2"
  end

  test "border-spacing-x" do
    assert tw("border-spacing-x-0 border-spacing-x-2") == "border-spacing-x-2"
  end

  test "border-spacing-y" do
    assert tw("border-spacing-y-0 border-spacing-y-2") == "border-spacing-y-2"
  end

  test "table-layout" do
    assert tw("table-auto table-fixed") == "table-fixed"
  end

  test "transition" do
    assert tw("transition-none transition-all transition") == "transition"
  end

  test "duration" do
    assert tw("duration-0 duration-2") == "duration-2"
  end

  test "ease" do
    assert tw("ease-linear ease-in ease-out ease-in-out") == "ease-in-out"
  end

  test "delay" do
    assert tw("delay-0 delay-2") == "delay-2"
  end

  test "animate" do
    assert tw("animate-none animate-spin animate-ping") == "animate-ping"
  end

  test "transform" do
    assert tw("transform transform-gpu transform-none") == "transform-none"
  end

  test "scale" do
    assert tw("scale-0 scale-2") == "scale-2"
  end

  test "scale-x" do
    assert tw("scale-x-0 scale-x-2") == "scale-x-2"
  end

  test "scale-y" do
    assert tw("scale-y-0 scale-y-2") == "scale-y-2"
  end

  test "rotate" do
    assert tw("rotate-0 rotate-2") == "rotate-2"
  end

  test "translate-x" do
    assert tw("translate-x-0.5 translate-x-px translate-x-2") == "translate-x-2"
  end

  test "translate-y" do
    assert tw("translate-y-0.5 translate-y-px translate-y-2") == "translate-y-2"
  end

  test "skew-x" do
    assert tw("skew-x-0 skew-x-2") == "skew-x-2"
  end

  test "skew-y" do
    assert tw("skew-y-0 skew-y-2") == "skew-y-2"
  end

  test "transform-origin" do
    assert tw("origin-center origin-top origin-bottom-right") == "origin-bottom-right"
  end

  test "accent" do
    assert tw("accent-auto accent-red-200") == "accent-red-200"
  end

  test "appearance" do
    assert tw("appearance-none fixed") == "appearance-none fixed"
  end

  test "cursor" do
    assert tw("cursor-auto cursor-default cursor-pointer") == "cursor-pointer"
  end

  test "caret-color" do
    assert tw("caret-red-200 caret-red-400") == "caret-red-400"
  end

  test "pointer-events" do
    assert tw("pointer-events-none pointer-events-auto") == "pointer-events-auto"
  end

  test "resize" do
    assert tw("resize-none resize-y resize-x resize") == "resize"
  end

  test "scroll-behavior" do
    assert tw("scroll-auto scroll-smooth")
  end

  test "scroll-m" do
    assert tw("scroll-m-0 scroll-m-2") == "scroll-m-2"
  end

  test "scroll-mx" do
    assert tw("scroll-mx-0 scroll-mx-2") == "scroll-mx-2"
  end

  test "scroll-my" do
    assert tw("scroll-my-0 scroll-my-2") == "scroll-my-2"
  end

  test "scroll-mt" do
    assert tw("scroll-mt-0 scroll-mt-2") == "scroll-mt-2"
  end

  test "scroll-mr" do
    assert tw("scroll-mr-0 scroll-mr-2") == "scroll-mr-2"
  end

  test "scroll-mb" do
    assert tw("scroll-mb-0 scroll-mb-2") == "scroll-mb-2"
  end

  test "scroll-ml" do
    assert tw("scroll-ml-0 scroll-ml-2") == "scroll-ml-2"
  end

  test "scroll-p" do
    assert tw("scroll-p-0 scroll-p-2") == "scroll-p-2"
  end

  test "scroll-px" do
    assert tw("scroll-px-0 scroll-px-2") == "scroll-px-2"
  end

  test "scroll-py" do
    assert tw("scroll-py-0 scroll-py-2") == "scroll-py-2"
  end

  test "scroll-pt" do
    assert tw("scroll-pt-0 scroll-pt-2") == "scroll-pt-2"
  end

  test "scroll-pr" do
    assert tw("scroll-pr-0 scroll-pr-2") == "scroll-pr-2"
  end

  test "scroll-pb" do
    assert tw("scroll-pb-0 scroll-pb-2") == "scroll-pb-2"
  end

  test "scroll-pl" do
    assert tw("scroll-pl-0 scroll-pl-2") == "scroll-pl-2"
  end

  test "snap-align" do
    assert tw("snap-start snap-end snap-center snap-align-none") == "snap-align-none"
  end

  test "snap-stop" do
    assert tw("snap-normal snap-always snap-start") == "snap-always snap-start"
  end

  test "snap-type" do
    assert tw("snap-none snap-x snap-y snap-both snap-normal snap-start") ==
             "snap-both snap-normal snap-start"
  end

  test "snap-strictness" do
    assert tw("snap-mandatory snap-proximity") == "snap-proximity"
  end

  test "touch" do
    assert tw("touch-auto touch-none touch-pinch-zoom touch-pan-x touch-pan-down") ==
             "touch-pan-down"
  end

  test "select" do
    assert tw("select-none select-text") == "select-text"
  end

  test "will-change" do
    assert tw("will-change-auto will-change-contents") == "will-change-contents"
  end

  test "fill" do
    assert tw("fill-none fill-red-200 fill-red-400") == "fill-red-400"
  end

  test "stroke-w" do
    assert tw("stroke-0 stroke-2") == "stroke-2"
  end

  test "stroke" do
    assert tw("stroke-red-200 stroke-red-400 stroke-none") == "stroke-none"
  end

  test "sr" do
    assert tw("not-sr-only sr-only") == "sr-only"
  end

  describe "conflicts across class groups" do
    test "fvn-spacing" do
      assert tw("tabular-nums diagonal-fractions normal-nums") == "normal-nums"
    end
  end
end
