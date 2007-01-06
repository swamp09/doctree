require tk

= module TkGrid

extend Tk
include Tk

ウィジェットを配置するためのモジュールです。
このモジュールにより、ウィジェットは格子状に配置されます。

普通、ウィジェットを格子状に配置するには[[m:TkWindow#grid]]が使われます。

== Module Functions

--- bbox(master, *args)

--- configure(widget1, widget2, ..., options=nil)
--- grid(widget1, widget2, ..., options=nil)

wigetNに対して、optionsで指定した配置を行います。
optionsは、以下のキーを持つハッシュです。

*"column"

桁位置を指定します。桁位置は左から順に0,1,2,...と数えます。

*"columnspan"

配置に使用する横方向のセルの数を指定します。

*"in"
*"ipadx"
*"ipady"
*"padx"
*"pady"

*"row"

行位置を指定します。行位置は上から順に0,1,2,...と数えます。

*"rowspan"

配置に使用する縦方向のセルの数を指定します。

*"sticky"

--- columnconfigure(master, index, args)

マスタウィジェットmasterの桁位置indexに関する属性を
argsで指定します。argsは、以下をキーに持つハッシュです。

*"minsize"
*"weight"
*"pad"

argsに空のハッシュ{}を指定すると現在の設定を返します。
((-argsのデフォルト値は、[[c:TkComm::None]]にした方が良い-))

  require "tk"
  
  f = TkFrame.new.pack
  p TkGrid.columnconfigure(f, 0, {})
  
  => "-minsize 0 -pad 0 -weight 0"

((-戻り値は、hashにしたい-))

--- rowconfigure(master, index, args)

マスタウィジェットmasterの行位置indexに関する属性を
argsで指定します。argsは、以下をキーに持つハッシュです。

*"minsize"
*"weight"
*"pad"

argsに空のハッシュ{}を指定すると現在の設定を返します。
((-argsのデフォルト値は、[[c:TkComm::None]]にした方が良い-))

  require "tk"
  
  f = TkFrame.new.pack
  p TkGrid.rowconfigure(f, 0, {})
  p TkGrid.rowconfigure(f, 0, {'minsize'=>10})
  p TkGrid.rowconfigure(f, 0, {})
  
  => "-minsize 0 -pad 0 -weight 0"
     ""
     "-minsize 10 -pad 0 -weight 0"

((-戻り値は、hashにしたい-))

  require "tk"
  
  module TkGrid
    def columnconfigure(master, index, args=None)
      Hash[tk_split_list(tk_call "grid", 'columnconfigure', master, index, *hash_kv(args))]
    end
  
    def rowconfigure(master, index, args=None)
      tk_tcl2ruby(tk_call "grid", 'rowconfigure', master, index, *hash_kv(args))
    end
  
    module_function :columnconfigure, :rowconfigure
  end
  
  
  f = TkFrame.new.pack
  p TkGrid.columnconfigure(f, 0)
  p TkGrid.columnconfigure(f, 0, {'minsize'=>10})
  p TkGrid.columnconfigure(f, 0)
  
  f = TkFrame.new.pack
  p TkGrid.rowconfigure(f, 0)
  p TkGrid.rowconfigure(f, 0, {'minsize'=>10})
  p TkGrid.rowconfigure(f, 0)

--- columnconfiginfo(master, index, slot=nil)

--- rowconfiginfo(master, index, slot=nil)

--- forget(*args)

--- info(slave)

--- location(master, x, y)

--- propagate(master, mode = Tk::None)

--- remove(*args)

--- size(master)

--- slaves(master, args)

== Instance Methods

--- anchor(master, anchor = Tk::None)

--- add(widget, *args)

== Constants

--- TkCommandNames

