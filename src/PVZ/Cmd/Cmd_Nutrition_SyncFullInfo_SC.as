package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Nutrition_SyncFullInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Nutrition_SyncFullInfo_SC";
      
      public static const CHANGEREAGENTLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Nutrition_SyncFullInfo_SC.changeReagentList","changeReagentList",1 << 3 | WireType.LENGTH_DELIMITED,Dto_Reagent);
      
      public static const ADDREAGENTLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Nutrition_SyncFullInfo_SC.addReagentList","addReagentList",2 << 3 | WireType.LENGTH_DELIMITED,Dto_Reagent);
      
      public static const DELREAGENTLIST:RepeatedFieldDescriptor$TYPE_INT64 = new RepeatedFieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Nutrition_SyncFullInfo_SC.delReagentList","delReagentList",3 << 3 | WireType.VARINT);
      
      public static const ACTIONFROM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Nutrition_SyncFullInfo_SC.actionFrom","actionFrom",4 << 3 | WireType.VARINT);
       
      
      public var changeReagentList:Array;
      
      public var addReagentList:Array;
      
      public var delReagentList:Array;
      
      private var actionFrom$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_Nutrition_SyncFullInfo_SC()
      {
         this.changeReagentList = [];
         this.addReagentList = [];
         this.delReagentList = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Nutrition_SyncFullInfo_SC.$MessageID;
      }
      
      public function clearActionFrom() : void
      {
         this.hasField$0 &= 4294967294;
         this.actionFrom$field = new uint();
      }
      
      public function get hasActionFrom() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set actionFrom(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.actionFrom$field = param1;
      }
      
      public function get actionFrom() : uint
      {
         return this.actionFrom$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc5_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.changeReagentList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.changeReagentList[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.addReagentList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.addReagentList[_loc3_]);
            _loc3_++;
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.delReagentList.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_INT64(param1,this.delReagentList[_loc4_]);
            _loc4_++;
         }
         if(this.hasActionFrom)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.actionFrom$field);
         }
         for(_loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc4_ >> 3)
            {
               case 1:
                  this.changeReagentList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_Reagent()));
                  break;
               case 2:
                  this.addReagentList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_Reagent()));
                  break;
               case 3:
                  if((_loc4_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_INT64,this.delReagentList);
                  }
                  else
                  {
                     this.delReagentList.push(ReadUtils.read$TYPE_INT64(param1));
                  }
                  break;
               case 4:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Nutrition_SyncFullInfo_SC.actionFrom cannot be set twice.");
                  }
                  _loc3_++;
                  this.actionFrom = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
