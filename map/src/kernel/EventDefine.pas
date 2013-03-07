unit EventDefine;

interface
uses
  Para;
const

  EV_CLOSE_DATALAYER              = $1;
  EV_ADD_DRAWLAYER                = $2;
  EV_CLOSE_DRAWLAYER              = $3;
  EV_LAYER_OUTBOX_CHANGED         = $4;
  EV_CLOSE_MAP                    = $5;
  EV_BEFORE_MAP_CHANGED           = $6;
  EV_AFTER_MAP_CHANGED            = $7;
  EV_MAP_ACTION_CHANGED           = $8;
  EV_DOLIST_CHANGED               = $9;
  EV_META_ANCHOR_CHANGED          = $A;
  EV_META_LABEL_CHANGED           = $B;
  EV_ERROR_INFO                   = $C;
  EV_WARNING_INFO                 = $D;
  EV_AFTER_CLOSE_DATALAYER        = $E;
  EV_AFTER_EDITSTATE_CHANGED      = $F;
  EV_AFTER_MAPSCALE_CHANGED       = $10;
type
  TScaleChanged = procedure(Sender: TObject;const AnOldScale,ANewScale: Double)of object;
  TMessageEvent = procedure(Sender:TObject; MsgID: Integer; Param: TGisParams)of object;
implementation

end.
