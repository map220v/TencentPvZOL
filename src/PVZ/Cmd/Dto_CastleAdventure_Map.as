package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_CastleAdventure_Map extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_CastleAdventure_Map";
      
      public static const CHESTID:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CastleAdventure_Map.chestId","chestId",1 << 3 | WireType.VARINT);
      
      public static const DICECOST:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_CastleAdventure_Map.diceCost","diceCost",2 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const POS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CastleAdventure_Map.pos","pos",10 << 3 | WireType.VARINT);
      
      public static const ROUTE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_CastleAdventure_Map.route","route",11 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const COMPLETION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CastleAdventure_Map.completion","completion",12 << 3 | WireType.VARINT);
      
      public static const STEPS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CastleAdventure_Map.steps","steps",13 << 3 | WireType.VARINT);
       
      
      public var chestId:Array;
      
      private var diceCost$field:Dto_IdNum;
      
      private var pos$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var route:Array;
      
      private var completion$field:uint;
      
      private var steps$field:uint;
      
      public function Dto_CastleAdventure_Map()
      {
         this.chestId = [];
         this.route = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_CastleAdventure_Map.$MessageID;
      }
      
      public function clearDiceCost() : void
      {
         this.diceCost$field = null;
      }
      
      public function get hasDiceCost() : Boolean
      {
         return this.diceCost$field != null;
      }
      
      public function set diceCost(param1:Dto_IdNum) : void
      {
         this.diceCost$field = param1;
      }
      
      public function get diceCost() : Dto_IdNum
      {
         return this.diceCost$field;
      }
      
      public function clearPos() : void
      {
         this.hasField$0 &= 4294967294;
         this.pos$field = new uint();
      }
      
      public function get hasPos() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set pos(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.pos$field = param1;
      }
      
      public function get pos() : uint
      {
         return this.pos$field;
      }
      
      public function clearCompletion() : void
      {
         this.hasField$0 &= 4294967293;
         this.completion$field = new uint();
      }
      
      public function get hasCompletion() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set completion(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.completion$field = param1;
      }
      
      public function get completion() : uint
      {
         return this.completion$field;
      }
      
      public function clearSteps() : void
      {
         this.hasField$0 &= 4294967291;
         this.steps$field = new uint();
      }
      
      public function get hasSteps() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set steps(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.steps$field = param1;
      }
      
      public function get steps() : uint
      {
         return this.steps$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.chestId.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.chestId[_loc2_]);
            _loc2_++;
         }
         if(this.hasDiceCost)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.diceCost$field);
         }
         if(this.hasPos)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.pos$field);
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.route.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,11);
            WriteUtils.write$TYPE_MESSAGE(param1,this.route[_loc3_]);
            _loc3_++;
         }
         if(this.hasCompletion)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,12);
            WriteUtils.write$TYPE_UINT32(param1,this.completion$field);
         }
         if(this.hasSteps)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,13);
            WriteUtils.write$TYPE_UINT32(param1,this.steps$field);
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc7_ >> 3)
            {
               case 1:
                  if((_loc7_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.chestId);
                  }
                  else
                  {
                     this.chestId.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CastleAdventure_Map.diceCost cannot be set twice.");
                  }
                  _loc3_++;
                  this.diceCost = new Dto_IdNum();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.diceCost);
                  break;
               case 10:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CastleAdventure_Map.pos cannot be set twice.");
                  }
                  _loc4_++;
                  this.pos = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 11:
                  this.route.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 12:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CastleAdventure_Map.completion cannot be set twice.");
                  }
                  _loc5_++;
                  this.completion = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 13:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CastleAdventure_Map.steps cannot be set twice.");
                  }
                  _loc6_++;
                  this.steps = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
