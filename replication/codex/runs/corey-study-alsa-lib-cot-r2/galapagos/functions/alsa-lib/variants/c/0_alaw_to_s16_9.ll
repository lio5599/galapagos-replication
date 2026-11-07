; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-cot-r2/functions/alsa-lib/variants/c/0_alaw_to_s16_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-cot-r2/functions/alsa-lib/variants/c/0_alaw_to_s16_9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @alaw_to_s16(i8 noundef zeroext 97)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @alaw_to_s16(i8 noundef zeroext %a_val) #0 {
entry:
  %a_val.addr = alloca i8, align 1
  %u = alloca i32, align 4
  %seg = alloca i32, align 4
  %exponent = alloca i32, align 4
  %t = alloca i32, align 4
  store i8 %a_val, ptr %a_val.addr, align 1
  %0 = load i8, ptr %a_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 85
  store i32 %xor, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %shr = ashr i32 %1, 4
  %and = and i32 %shr, 7
  store i32 %and, ptr %seg, align 4
  %2 = load i32, ptr %seg, align 4
  %cmp = icmp eq i32 %2, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %3 = load i32, ptr %seg, align 4
  %sub = sub nsw i32 %3, 1
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 0, %cond.true ], [ %sub, %cond.false ]
  store i32 %cond, ptr %exponent, align 4
  %4 = load i32, ptr %u, align 4
  %and2 = and i32 %4, 15
  %mul = mul nsw i32 2, %and2
  %add = add nsw i32 %mul, 1
  %5 = load i32, ptr %seg, align 4
  %cmp3 = icmp ne i32 %5, 0
  %conv4 = zext i1 %cmp3 to i32
  %mul5 = mul nsw i32 %conv4, 32
  %add6 = add nsw i32 %add, %mul5
  store i32 %add6, ptr %t, align 4
  %6 = load i32, ptr %exponent, align 4
  %and7 = and i32 %6, 1
  %tobool = icmp ne i32 %and7, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  %7 = load i32, ptr %t, align 4
  %mul8 = mul nsw i32 %7, 2
  store i32 %mul8, ptr %t, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end
  %8 = load i32, ptr %exponent, align 4
  %and9 = and i32 %8, 2
  %tobool10 = icmp ne i32 %and9, 0
  br i1 %tobool10, label %if.then11, label %if.end13

if.then11:                                        ; preds = %if.end
  %9 = load i32, ptr %t, align 4
  %mul12 = mul nsw i32 %9, 4
  store i32 %mul12, ptr %t, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.then11, %if.end
  %10 = load i32, ptr %exponent, align 4
  %and14 = and i32 %10, 4
  %tobool15 = icmp ne i32 %and14, 0
  br i1 %tobool15, label %if.then16, label %if.end18

if.then16:                                        ; preds = %if.end13
  %11 = load i32, ptr %t, align 4
  %mul17 = mul nsw i32 %11, 16
  store i32 %mul17, ptr %t, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.then16, %if.end13
  %12 = load i32, ptr %t, align 4
  %mul19 = mul nsw i32 %12, 8
  store i32 %mul19, ptr %t, align 4
  %13 = load i32, ptr %u, align 4
  %and20 = and i32 %13, 128
  %tobool21 = icmp ne i32 %and20, 0
  br i1 %tobool21, label %cond.true22, label %cond.false23

cond.true22:                                      ; preds = %if.end18
  %14 = load i32, ptr %t, align 4
  br label %cond.end25

cond.false23:                                     ; preds = %if.end18
  %15 = load i32, ptr %t, align 4
  %sub24 = sub nsw i32 0, %15
  br label %cond.end25

cond.end25:                                       ; preds = %cond.false23, %cond.true22
  %cond26 = phi i32 [ %14, %cond.true22 ], [ %sub24, %cond.false23 ]
  ret i32 %cond26
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
