package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_WorldMap_GetInfo_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_WorldMap_GetInfo_CS";
      
      public static const LEFTTOP:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_WorldMap_GetInfo_CS.leftTop","leftTop",1 << 3 | WireType.LENGTH_DELIMITED,Dto_WorldMap_Pos);
      
      public static const RIGHTTOP:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_WorldMap_GetInfo_CS.rightTop","rightTop",2 << 3 | WireType.LENGTH_DELIMITED,Dto_WorldMap_Pos);
      
      public static const LEFTBOTTOM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_WorldMap_GetInfo_CS.leftBottom","leftBottom",3 << 3 | WireType.LENGTH_DELIMITED,Dto_WorldMap_Pos);
      
      public static const RIGHTBOTTOM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_WorldMap_GetInfo_CS.rightBottom","rightBottom",4 << 3 | WireType.LENGTH_DELIMITED,Dto_WorldMap_Pos);
      
      public static const AREATYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_WorldMap_GetInfo_CS.areaType","areaType",5 << 3 | WireType.VARINT);
      
      public static const ISENTERMAP:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_WorldMap_GetInfo_CS.isEnterMap","isEnterMap",6 << 3 | WireType.VARINT);
       
      
      private var leftTop$field:Dto_WorldMap_Pos;
      
      private var rightTop$field:Dto_WorldMap_Pos;
      
      private var leftBottom$field:Dto_WorldMap_Pos;
      
      private var rightBottom$field:Dto_WorldMap_Pos;
      
      private var areaType$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var isEnterMap$field:Boolean;
      
      public function Cmd_WorldMap_GetInfo_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_WorldMap_GetInfo_CS.$MessageID;
      }
      
      public function clearLeftTop() : void
      {
         this.leftTop$field = null;
      }
      
      public function get hasLeftTop() : Boolean
      {
         return this.leftTop$field != null;
      }
      
      public function set leftTop(param1:Dto_WorldMap_Pos) : void
      {
         this.leftTop$field = param1;
      }
      
      public function get leftTop() : Dto_WorldMap_Pos
      {
         return this.leftTop$field;
      }
      
      public function clearRightTop() : void
      {
         this.rightTop$field = null;
      }
      
      public function get hasRightTop() : Boolean
      {
         return this.rightTop$field != null;
      }
      
      public function set rightTop(param1:Dto_WorldMap_Pos) : void
      {
         this.rightTop$field = param1;
      }
      
      public function get rightTop() : Dto_WorldMap_Pos
      {
         return this.rightTop$field;
      }
      
      public function clearLeftBottom() : void
      {
         this.leftBottom$field = null;
      }
      
      public function get hasLeftBottom() : Boolean
      {
         return this.leftBottom$field != null;
      }
      
      public function set leftBottom(param1:Dto_WorldMap_Pos) : void
      {
         this.leftBottom$field = param1;
      }
      
      public function get leftBottom() : Dto_WorldMap_Pos
      {
         return this.leftBottom$field;
      }
      
      public function clearRightBottom() : void
      {
         this.rightBottom$field = null;
      }
      
      public function get hasRightBottom() : Boolean
      {
         return this.rightBottom$field != null;
      }
      
      public function set rightBottom(param1:Dto_WorldMap_Pos) : void
      {
         this.rightBottom$field = param1;
      }
      
      public function get rightBottom() : Dto_WorldMap_Pos
      {
         return this.rightBottom$field;
      }
      
      public function clearAreaType() : void
      {
         this.hasField$0 &= 4294967294;
         this.areaType$field = new uint();
      }
      
      public function get hasAreaType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set areaType(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.areaType$field = param1;
      }
      
      public function get areaType() : uint
      {
         return this.areaType$field;
      }
      
      public function clearIsEnterMap() : void
      {
         this.hasField$0 &= 4294967293;
         this.isEnterMap$field = new Boolean();
      }
      
      public function get hasIsEnterMap() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set isEnterMap(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.isEnterMap$field = param1;
      }
      
      public function get isEnterMap() : Boolean
      {
         if(!this.hasIsEnterMap)
         {
            return false;
         }
         return this.isEnterMap$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasLeftTop)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.leftTop$field);
         }
         if(this.hasRightTop)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rightTop$field);
         }
         if(this.hasLeftBottom)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.leftBottom$field);
         }
         if(this.hasRightBottom)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rightBottom$field);
         }
         if(this.hasAreaType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.areaType$field);
         }
         if(this.hasIsEnterMap)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_BOOL(param1,this.isEnterMap$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc9_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc9_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc9_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_WorldMap_GetInfo_CS.leftTop cannot be set twice.");
                  }
                  _loc3_++;
                  this.leftTop = new Dto_WorldMap_Pos();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.leftTop);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_WorldMap_GetInfo_CS.rightTop cannot be set twice.");
                  }
                  _loc4_++;
                  this.rightTop = new Dto_WorldMap_Pos();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.rightTop);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_WorldMap_GetInfo_CS.leftBottom cannot be set twice.");
                  }
                  _loc5_++;
                  this.leftBottom = new Dto_WorldMap_Pos();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.leftBottom);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_WorldMap_GetInfo_CS.rightBottom cannot be set twice.");
                  }
                  _loc6_++;
                  this.rightBottom = new Dto_WorldMap_Pos();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.rightBottom);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_WorldMap_GetInfo_CS.areaType cannot be set twice.");
                  }
                  _loc7_++;
                  this.areaType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_WorldMap_GetInfo_CS.isEnterMap cannot be set twice.");
                  }
                  _loc8_++;
                  this.isEnterMap = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
