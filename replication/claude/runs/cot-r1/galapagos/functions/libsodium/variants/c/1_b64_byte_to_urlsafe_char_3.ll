; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_3.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_urlsafe_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_urlsafe_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %cmp = icmp ugt i32 %0, 63
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end20

cond.false:                                       ; preds = %entry
  %1 = load i32, ptr %x.addr, align 4
  %cmp1 = icmp eq i32 %1, 63
  br i1 %cmp1, label %cond.true2, label %cond.false3

cond.true2:                                       ; preds = %cond.false
  br label %cond.end18

cond.false3:                                      ; preds = %cond.false
  %2 = load i32, ptr %x.addr, align 4
  %cmp4 = icmp eq i32 %2, 62
  br i1 %cmp4, label %cond.true5, label %cond.false6

cond.true5:                                       ; preds = %cond.false3
  br label %cond.end16

cond.false6:                                      ; preds = %cond.false3
  %3 = load i32, ptr %x.addr, align 4
  %cmp7 = icmp uge i32 %3, 52
  br i1 %cmp7, label %cond.true8, label %cond.false9

cond.true8:                                       ; preds = %cond.false6
  %4 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %4, 4
  br label %cond.end14

cond.false9:                                      ; preds = %cond.false6
  %5 = load i32, ptr %x.addr, align 4
  %cmp10 = icmp uge i32 %5, 26
  br i1 %cmp10, label %cond.true11, label %cond.false12

cond.true11:                                      ; preds = %cond.false9
  %6 = load i32, ptr %x.addr, align 4
  %add = add i32 %6, 71
  br label %cond.end

cond.false12:                                     ; preds = %cond.false9
  %7 = load i32, ptr %x.addr, align 4
  %add13 = add i32 %7, 65
  br label %cond.end

cond.end:                                         ; preds = %cond.false12, %cond.true11
  %cond = phi i32 [ %add, %cond.true11 ], [ %add13, %cond.false12 ]
  br label %cond.end14

cond.end14:                                       ; preds = %cond.end, %cond.true8
  %cond15 = phi i32 [ %sub, %cond.true8 ], [ %cond, %cond.end ]
  br label %cond.end16

cond.end16:                                       ; preds = %cond.end14, %cond.true5
  %cond17 = phi i32 [ 45, %cond.true5 ], [ %cond15, %cond.end14 ]
  br label %cond.end18

cond.end18:                                       ; preds = %cond.end16, %cond.true2
  %cond19 = phi i32 [ 95, %cond.true2 ], [ %cond17, %cond.end16 ]
  br label %cond.end20

cond.end20:                                       ; preds = %cond.end18, %cond.true
  %cond21 = phi i32 [ 0, %cond.true ], [ %cond19, %cond.end18 ]
  ret i32 %cond21
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}
