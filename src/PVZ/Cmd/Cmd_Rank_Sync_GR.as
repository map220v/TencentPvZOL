package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Rank_Sync_GR extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Rank_Sync_GR";
      
      public static const ROLEPOWER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Rank_Sync_GR.rolePower","rolePower",1 << 3 | WireType.LENGTH_DELIMITED,Dto_Rank_RolePower);
      
      public static const NEWSCREWUP:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Rank_Sync_GR.newScrewUp","newScrewUp",2 << 3 | WireType.LENGTH_DELIMITED,Dto_Rank_NewScrewUp);
      
      public static const NOENDFUBEN:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Rank_Sync_GR.noEndFuben","noEndFuben",3 << 3 | WireType.LENGTH_DELIMITED,Dto_Rank_NoEndFuben);
      
      public static const PUPPETPOWER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Rank_Sync_GR.puppetPower","puppetPower",4 << 3 | WireType.LENGTH_DELIMITED,Dto_Rank_PuppetPower);
       
      
      private var rolePower$field:Dto_Rank_RolePower;
      
      private var newScrewUp$field:Dto_Rank_NewScrewUp;
      
      private var noEndFuben$field:Dto_Rank_NoEndFuben;
      
      private var puppetPower$field:Dto_Rank_PuppetPower;
      
      public function Cmd_Rank_Sync_GR()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Rank_Sync_GR.$MessageID;
      }
      
      public function clearRolePower() : void
      {
         this.rolePower$field = null;
      }
      
      public function get hasRolePower() : Boolean
      {
         return this.rolePower$field != null;
      }
      
      public function set rolePower(param1:Dto_Rank_RolePower) : void
      {
         this.rolePower$field = param1;
      }
      
      public function get rolePower() : Dto_Rank_RolePower
      {
         return this.rolePower$field;
      }
      
      public function clearNewScrewUp() : void
      {
         this.newScrewUp$field = null;
      }
      
      public function get hasNewScrewUp() : Boolean
      {
         return this.newScrewUp$field != null;
      }
      
      public function set newScrewUp(param1:Dto_Rank_NewScrewUp) : void
      {
         this.newScrewUp$field = param1;
      }
      
      public function get newScrewUp() : Dto_Rank_NewScrewUp
      {
         return this.newScrewUp$field;
      }
      
      public function clearNoEndFuben() : void
      {
         this.noEndFuben$field = null;
      }
      
      public function get hasNoEndFuben() : Boolean
      {
         return this.noEndFuben$field != null;
      }
      
      public function set noEndFuben(param1:Dto_Rank_NoEndFuben) : void
      {
         this.noEndFuben$field = param1;
      }
      
      public function get noEndFuben() : Dto_Rank_NoEndFuben
      {
         return this.noEndFuben$field;
      }
      
      public function clearPuppetPower() : void
      {
         this.puppetPower$field = null;
      }
      
      public function get hasPuppetPower() : Boolean
      {
         return this.puppetPower$field != null;
      }
      
      public function set puppetPower(param1:Dto_Rank_PuppetPower) : void
      {
         this.puppetPower$field = param1;
      }
      
      public function get puppetPower() : Dto_Rank_PuppetPower
      {
         return this.puppetPower$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRolePower)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rolePower$field);
         }
         if(this.hasNewScrewUp)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.newScrewUp$field);
         }
         if(this.hasNoEndFuben)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.noEndFuben$field);
         }
         if(this.hasPuppetPower)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.puppetPower$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Rank_Sync_GR.rolePower cannot be set twice.");
                  }
                  _loc3_++;
                  this.rolePower = new Dto_Rank_RolePower();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.rolePower);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Rank_Sync_GR.newScrewUp cannot be set twice.");
                  }
                  _loc4_++;
                  this.newScrewUp = new Dto_Rank_NewScrewUp();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.newScrewUp);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Rank_Sync_GR.noEndFuben cannot be set twice.");
                  }
                  _loc5_++;
                  this.noEndFuben = new Dto_Rank_NoEndFuben();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.noEndFuben);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Rank_Sync_GR.puppetPower cannot be set twice.");
                  }
                  _loc6_++;
                  this.puppetPower = new Dto_Rank_PuppetPower();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.puppetPower);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
