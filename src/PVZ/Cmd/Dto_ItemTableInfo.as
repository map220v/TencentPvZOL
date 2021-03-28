package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_ItemTableInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_ItemTableInfo";
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ItemTableInfo.id","id",1 << 3 | WireType.VARINT);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_ItemTableInfo.name","name",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const DESC:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_ItemTableInfo.desc","desc",3 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const ICON:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_ItemTableInfo.icon","icon",4 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const MINLVREQUIRED:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ItemTableInfo.minLvRequired","minLvRequired",5 << 3 | WireType.VARINT);
      
      public static const TYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ItemTableInfo.type","type",6 << 3 | WireType.VARINT);
      
      public static const SUBTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ItemTableInfo.subType","subType",7 << 3 | WireType.VARINT);
      
      public static const QUALITY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ItemTableInfo.quality","quality",8 << 3 | WireType.VARINT);
      
      public static const STACKNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ItemTableInfo.stackNum","stackNum",9 << 3 | WireType.VARINT);
      
      public static const ISUSE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ItemTableInfo.isUse","isUse",10 << 3 | WireType.VARINT);
      
      public static const ISMULUSE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ItemTableInfo.isMulUse","isMulUse",11 << 3 | WireType.VARINT);
      
      public static const ISCANSELL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ItemTableInfo.isCanSell","isCanSell",12 << 3 | WireType.VARINT);
      
      public static const SELLPRICE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ItemTableInfo.sellPrice","sellPrice",13 << 3 | WireType.VARINT);
      
      public static const ISCANSHOW:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ItemTableInfo.isCanShow","isCanShow",14 << 3 | WireType.VARINT);
      
      public static const CARDITEMID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_ItemTableInfo.cardItemId","cardItemId",15 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const GAINWAY:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_ItemTableInfo.gainWay","gainWay",16 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const USEEFFECT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_ItemTableInfo.useEffect","useEffect",17 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const MAINTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ItemTableInfo.mainType","mainType",18 << 3 | WireType.VARINT);
       
      
      public var id:uint;
      
      public var name:String;
      
      public var desc:String;
      
      public var icon:String;
      
      public var minLvRequired:uint;
      
      public var type:uint;
      
      public var subType:uint;
      
      public var quality:uint;
      
      public var stackNum:uint;
      
      public var isUse:uint;
      
      public var isMulUse:uint;
      
      public var isCanSell:uint;
      
      public var sellPrice:uint;
      
      public var isCanShow:uint;
      
      public var cardItemId:String;
      
      public var gainWay:String;
      
      public var useEffect:String;
      
      public var mainType:uint;
      
      public function Dto_ItemTableInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_ItemTableInfo.$MessageID;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         WriteUtils.writeTag(param1,WireType.VARINT,1);
         WriteUtils.write$TYPE_UINT32(param1,this.id);
         WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
         WriteUtils.write$TYPE_STRING(param1,this.name);
         WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
         WriteUtils.write$TYPE_STRING(param1,this.desc);
         WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
         WriteUtils.write$TYPE_STRING(param1,this.icon);
         WriteUtils.writeTag(param1,WireType.VARINT,5);
         WriteUtils.write$TYPE_UINT32(param1,this.minLvRequired);
         WriteUtils.writeTag(param1,WireType.VARINT,6);
         WriteUtils.write$TYPE_UINT32(param1,this.type);
         WriteUtils.writeTag(param1,WireType.VARINT,7);
         WriteUtils.write$TYPE_UINT32(param1,this.subType);
         WriteUtils.writeTag(param1,WireType.VARINT,8);
         WriteUtils.write$TYPE_UINT32(param1,this.quality);
         WriteUtils.writeTag(param1,WireType.VARINT,9);
         WriteUtils.write$TYPE_UINT32(param1,this.stackNum);
         WriteUtils.writeTag(param1,WireType.VARINT,10);
         WriteUtils.write$TYPE_UINT32(param1,this.isUse);
         WriteUtils.writeTag(param1,WireType.VARINT,11);
         WriteUtils.write$TYPE_UINT32(param1,this.isMulUse);
         WriteUtils.writeTag(param1,WireType.VARINT,12);
         WriteUtils.write$TYPE_UINT32(param1,this.isCanSell);
         WriteUtils.writeTag(param1,WireType.VARINT,13);
         WriteUtils.write$TYPE_UINT32(param1,this.sellPrice);
         WriteUtils.writeTag(param1,WireType.VARINT,14);
         WriteUtils.write$TYPE_UINT32(param1,this.isCanShow);
         WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,15);
         WriteUtils.write$TYPE_STRING(param1,this.cardItemId);
         WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,16);
         WriteUtils.write$TYPE_STRING(param1,this.gainWay);
         WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,17);
         WriteUtils.write$TYPE_STRING(param1,this.useEffect);
         WriteUtils.writeTag(param1,WireType.VARINT,18);
         WriteUtils.write$TYPE_UINT32(param1,this.mainType);
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc21_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         var _loc12_:uint = 0;
         var _loc13_:uint = 0;
         var _loc14_:uint = 0;
         var _loc15_:uint = 0;
         var _loc16_:uint = 0;
         var _loc17_:uint = 0;
         var _loc18_:uint = 0;
         var _loc19_:uint = 0;
         var _loc20_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc21_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc21_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ItemTableInfo.id cannot be set twice.");
                  }
                  _loc3_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ItemTableInfo.name cannot be set twice.");
                  }
                  _loc4_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ItemTableInfo.desc cannot be set twice.");
                  }
                  _loc5_++;
                  this.desc = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ItemTableInfo.icon cannot be set twice.");
                  }
                  _loc6_++;
                  this.icon = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ItemTableInfo.minLvRequired cannot be set twice.");
                  }
                  _loc7_++;
                  this.minLvRequired = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ItemTableInfo.type cannot be set twice.");
                  }
                  _loc8_++;
                  this.type = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ItemTableInfo.subType cannot be set twice.");
                  }
                  _loc9_++;
                  this.subType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ItemTableInfo.quality cannot be set twice.");
                  }
                  _loc10_++;
                  this.quality = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ItemTableInfo.stackNum cannot be set twice.");
                  }
                  _loc11_++;
                  this.stackNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ItemTableInfo.isUse cannot be set twice.");
                  }
                  _loc12_++;
                  this.isUse = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 11:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ItemTableInfo.isMulUse cannot be set twice.");
                  }
                  _loc13_++;
                  this.isMulUse = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 12:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ItemTableInfo.isCanSell cannot be set twice.");
                  }
                  _loc14_++;
                  this.isCanSell = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 13:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ItemTableInfo.sellPrice cannot be set twice.");
                  }
                  _loc15_++;
                  this.sellPrice = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 14:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ItemTableInfo.isCanShow cannot be set twice.");
                  }
                  _loc16_++;
                  this.isCanShow = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 15:
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ItemTableInfo.cardItemId cannot be set twice.");
                  }
                  _loc17_++;
                  this.cardItemId = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 16:
                  if(_loc18_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ItemTableInfo.gainWay cannot be set twice.");
                  }
                  _loc18_++;
                  this.gainWay = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 17:
                  if(_loc19_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ItemTableInfo.useEffect cannot be set twice.");
                  }
                  _loc19_++;
                  this.useEffect = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 18:
                  if(_loc20_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ItemTableInfo.mainType cannot be set twice.");
                  }
                  _loc20_++;
                  this.mainType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc21_);
                  break;
            }
         }
      }
   }
}
