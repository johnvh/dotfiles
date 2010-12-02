" Vim syntax file
" Language:     ActionScript
" Maintainer:   Manish Jethani <manish.jethani@gmail.com>
" URL:          http://geocities.com/manish_jethani/actionscript.vim
" Last Change:  2006 June 26

if exists("b:current_syntax")
  finish
endif

syn region  asStringDQ	      start=+"+  skip=+\\\\\|\\"+  end=+"+
syn region  asStringSQ	      start=+'+  skip=+\\\\\|\\'+  end=+'+
syn match   asNumber          "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn region  asRegExp          start=+/+ skip=+\\\\\|\\/+ end=+/[gismx]\?\s*$+ end=+/[gismx]\?\s*[;,)]+me=e-1 oneline
" TODO: E4X

syn keyword asCommentTodo     TODO FIXME XXX TBD contained

syn match   asComment         "//.*$" contains=asCommentTodo
syn region  asComment         start="/\*"  end="\*/" contains=asCommentTodo
syn region  asDocComment      start="/\*\*" end="\*\/"

syn keyword asDirective       import include
syn match   asDirective       "\<use\s\+namespace\>"

syn keyword asAttribute       public private internal protected override final dynamic native static

syn keyword asDefinition      const var class extends interface implements package namespace
syn match   asDefinition        "\<function\(\s\+[gs]et\)\?\>"

syn keyword asGlobal          NaN Infinity undefined eval parseInt parseFloat isNaN isFinite decodeURI decodeURIComponent encodeURI encodeURIComponent

syn keyword asType            Object Function Array String Boolean Number Date Error XML
syn keyword asType            int uint void *
syn match   asType           "\:[A-Za-z_][A-Za-z0-9_]\+" 
" TODO: highlight all types

syn keyword asStatement       if else do while for each with switch case default continue break return throw try catch finally
syn match   asStatement       "\<for\s\+each\>"

syn keyword asIdentifier      super this

syn keyword asConstant        null true false
syn keyword asOperator        new in is as typeof instanceof delete

syn match   asBraces          "[{}]"

syn keyword asIntrinsicClass  Accessibility AccessibilityProperties AccImpl ActionScriptVersion ActivityEvent Animator AntiAliasType ApplicationDomain ArgumentError arguments Array AsyncErrorEvent AutoLayoutEvent AVM1Movie Back Back BaseButton BaseScrollPane BevelFilter BezierEase BezierSegment Bitmap BitmapData BitmapDataChannel BitmapFilter BitmapFilterQuality BitmapFilterType BlendMode Blinds BlurFilter Boolean Bounce Bounce Button ButtonAccImpl ButtonLabelPlacement ByteArray Camera Capabilities CapsStyle CaptionChangeEvent CaptionTargetEvent CellRenderer CheckBox CheckBoxAccImpl Circular Class Color ColorMatrixFilter ColorPicker ColorPickerEvent ColorTransform ComboBox ComboBoxAccImpl ComponentEvent ContextMenu ContextMenuBuiltInItems ContextMenuEvent ContextMenuItem ConvolutionFilter CSMSettings Cubic CuePointType CustomActions CustomEase DataChangeEvent DataChangeType DataEvent DataGrid DataGridAccImpl DataGridCellEditor DataGridColumn DataGridEvent DataGridEventReason DataProvider Date DefinitionError DeleteObjectSample Dictionary DisplacementMapFilter DisplacementMapFilterMode DisplayObject DisplayObjectContainer DropShadowFilter Elastic Elastic Endian EOFError Error ErrorEvent EvalError Event EventDispatcher EventPhase Exponential ExternalInterface Fade FileFilter FileReference FileReferenceList FLVPlayback FLVPlaybackCaptioning Fly FocusEvent FocusManager Font FontStyle FontType FrameLabel FullScreenEvent Function FunctionEase GlowFilter GradientBevelFilter GradientGlowFilter GradientType Graphics GridFitType HeaderRenderer HTTPStatusEvent IBitmapDrawable ICellRenderer ID3Info IDataInput IDataOutput IDynamicPropertyOutput IDynamicPropertyWriter IEventDispatcher IExternalizable IFocusManager IFocusManagerComponent IFocusManagerGroup IllegalOperationError ImageCell IME IMEConversionMode IMEEvent INCManager IndeterminateBar int InteractionInputType InteractiveObject InterpolationMethod InvalidationType InvalidSWFError IOError IOErrorEvent Iris ITween IVPEvent JointStyle Keyboard KeyboardEvent Keyframe KeyLocation Label LabelButton LabelButtonAccImpl LayoutEvent Linear LineScaleMode List ListAccImpl ListData ListEvent LivePreviewParent Loader LoaderContext LoaderInfo LocalConnection Locale Math Matrix MatrixTransformer MemoryError MetadataEvent Microphone MorphShape Motion MotionEvent Mouse MouseEvent MovieClip Namespace NCManager NCManagerNative NetConnection NetStatusEvent NetStream NewObjectSample None Number NumericStepper Object ObjectEncoding Photo PixelDissolve PixelSnapping Point PrintJob PrintJobOptions PrintJobOrientation ProgressBar ProgressBarDirection ProgressBarMode ProgressEvent Proxy QName Quadratic Quartic Quintic RadioButton RadioButtonAccImpl RadioButtonGroup RangeError Rectangle ReferenceError RegExp Regular Responder Rotate RotateDirection Sample Scene ScriptTimeoutError ScrollBar ScrollBarDirection ScrollEvent ScrollPane ScrollPolicy Security SecurityDomain SecurityError SecurityErrorEvent SecurityPanel SelectableList SelectableListAccImpl Shape SharedObject SharedObjectFlushStatus SimpleButton SimpleCollectionItem SimpleEase Sine SkinErrorEvent Slider SliderDirection SliderEvent SliderEventClickTarget Socket Sound SoundChannel SoundEvent SoundLoaderContext SoundMixer SoundTransform Source SpreadMethod Sprite Squeeze StackFrame StackOverflowError Stage StageAlign StageDisplayState StageQuality StageScaleMode StaticText StatusEvent String Strong StyleManager StyleSheet SWFVersion SyncEvent SyntaxError System TextArea TextColorType TextDisplayMode TextEvent TextField TextFieldAutoSize TextFieldType TextFormat TextFormatAlign TextInput TextLineMetrics TextRenderer TextSnapshot TileList TileListAccImpl TileListCollectionItem TileListData Timer TimerEvent Transform Transition TransitionManager Tween Tweenables TweenEvent TypeError UIComponent UIComponentAccImpl UILoader uint UIScrollBar URIError URLLoader URLLoaderDataFormat URLRequest URLRequestHeader URLRequestMethod URLStream URLVariables VerifyError Video VideoAlign VideoError VideoEvent VideoPlayer VideoProgressEvent VideoScaleMode VideoState Wipe XML XMLDocument XMLListXMLNode XMLNodeType XMLSocket XMLUI Zoom 

" Flex metadata
syn keyword asMetadataTag     Bindable DefaultProperty Effect Event Exclude IconFile MaxChildren ResourceBundle Style contained
syn match   asMetadata        "^\s*\[.*" contains=asMetadataTag,asStringDQ,asComment

syn sync fromstart
syn sync maxlines=300

hi def link asStringDQ        String
hi def link asStringSQ        String
hi def link asNumber          Number
hi def link asRegExp          Special
hi def link asCommentTodo     Todo
hi def link asComment         Comment
hi def link asDirective       Include
hi def link asAttribute       Define
hi def link asDefinition      Structure
hi def link asGlobal          Macro
hi def link asType            Type
hi def link asStatement       Statement
hi def link asIdentifier      Identifier
hi def link asConstant        Constant
hi def link asOperator        Operator
hi def link asBraces          Function
hi def link asMetadataTag     PreProc
hi def link asIntrinsicClass  Type
hi def link asDocComment      Special

let b:current_syntax = "actionscript"

" vim: ts=8
