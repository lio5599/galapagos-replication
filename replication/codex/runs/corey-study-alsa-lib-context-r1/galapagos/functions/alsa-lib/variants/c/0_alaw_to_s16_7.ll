; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-context-r1/functions/alsa-lib/variants/c/0_alaw_to_s16_7.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-context-r1/functions/alsa-lib/variants/c/0_alaw_to_s16_7.c"
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
  %x = alloca i32, align 4
  %code = alloca i32, align 4
  %t = alloca i32, align 4
  store i8 %a_val, ptr %a_val.addr, align 1
  %0 = load i8, ptr %a_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 85
  store i32 %xor, ptr %x, align 4
  %1 = load i32, ptr %x, align 4
  %and = and i32 %1, 127
  store i32 %and, ptr %code, align 4
  %2 = load i32, ptr %code, align 4
  %cmp = icmp slt i32 %2, 16
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %3 = load i32, ptr %code, align 4
  %mul = mul nsw i32 %3, 16
  %add = add nsw i32 %mul, 8
  store i32 %add, ptr %t, align 4
  br label %if.end51

if.else:                                          ; preds = %entry
  %4 = load i32, ptr %code, align 4
  %cmp2 = icmp slt i32 %4, 32
  br i1 %cmp2, label %if.then4, label %if.else7

if.then4:                                         ; preds = %if.else
  %5 = load i32, ptr %code, align 4
  %sub = sub nsw i32 %5, 16
  %mul5 = mul nsw i32 %sub, 16
  %add6 = add nsw i32 %mul5, 264
  store i32 %add6, ptr %t, align 4
  br label %if.end50

if.else7:                                         ; preds = %if.else
  %6 = load i32, ptr %code, align 4
  %cmp8 = icmp slt i32 %6, 48
  br i1 %cmp8, label %if.then10, label %if.else14

if.then10:                                        ; preds = %if.else7
  %7 = load i32, ptr %code, align 4
  %sub11 = sub nsw i32 %7, 32
  %mul12 = mul nsw i32 %sub11, 32
  %add13 = add nsw i32 %mul12, 528
  store i32 %add13, ptr %t, align 4
  br label %if.end49

if.else14:                                        ; preds = %if.else7
  %8 = load i32, ptr %code, align 4
  %cmp15 = icmp slt i32 %8, 64
  br i1 %cmp15, label %if.then17, label %if.else21

if.then17:                                        ; preds = %if.else14
  %9 = load i32, ptr %code, align 4
  %sub18 = sub nsw i32 %9, 48
  %mul19 = mul nsw i32 %sub18, 64
  %add20 = add nsw i32 %mul19, 1056
  store i32 %add20, ptr %t, align 4
  br label %if.end48

if.else21:                                        ; preds = %if.else14
  %10 = load i32, ptr %code, align 4
  %cmp22 = icmp slt i32 %10, 80
  br i1 %cmp22, label %if.then24, label %if.else28

if.then24:                                        ; preds = %if.else21
  %11 = load i32, ptr %code, align 4
  %sub25 = sub nsw i32 %11, 64
  %mul26 = mul nsw i32 %sub25, 128
  %add27 = add nsw i32 %mul26, 2112
  store i32 %add27, ptr %t, align 4
  br label %if.end47

if.else28:                                        ; preds = %if.else21
  %12 = load i32, ptr %code, align 4
  %cmp29 = icmp slt i32 %12, 96
  br i1 %cmp29, label %if.then31, label %if.else35

if.then31:                                        ; preds = %if.else28
  %13 = load i32, ptr %code, align 4
  %sub32 = sub nsw i32 %13, 80
  %mul33 = mul nsw i32 %sub32, 256
  %add34 = add nsw i32 %mul33, 4224
  store i32 %add34, ptr %t, align 4
  br label %if.end46

if.else35:                                        ; preds = %if.else28
  %14 = load i32, ptr %code, align 4
  %cmp36 = icmp slt i32 %14, 112
  br i1 %cmp36, label %if.then38, label %if.else42

if.then38:                                        ; preds = %if.else35
  %15 = load i32, ptr %code, align 4
  %sub39 = sub nsw i32 %15, 96
  %mul40 = mul nsw i32 %sub39, 512
  %add41 = add nsw i32 %mul40, 8448
  store i32 %add41, ptr %t, align 4
  br label %if.end

if.else42:                                        ; preds = %if.else35
  %16 = load i32, ptr %code, align 4
  %sub43 = sub nsw i32 %16, 112
  %mul44 = mul nsw i32 %sub43, 1024
  %add45 = add nsw i32 %mul44, 16896
  store i32 %add45, ptr %t, align 4
  br label %if.end

if.end:                                           ; preds = %if.else42, %if.then38
  br label %if.end46

if.end46:                                         ; preds = %if.end, %if.then31
  br label %if.end47

if.end47:                                         ; preds = %if.end46, %if.then24
  br label %if.end48

if.end48:                                         ; preds = %if.end47, %if.then17
  br label %if.end49

if.end49:                                         ; preds = %if.end48, %if.then10
  br label %if.end50

if.end50:                                         ; preds = %if.end49, %if.then4
  br label %if.end51

if.end51:                                         ; preds = %if.end50, %if.then
  %17 = load i32, ptr %x, align 4
  %and52 = and i32 %17, 128
  %tobool = icmp ne i32 %and52, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end51
  %18 = load i32, ptr %t, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end51
  %19 = load i32, ptr %t, align 4
  %sub53 = sub nsw i32 0, %19
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %18, %cond.true ], [ %sub53, %cond.false ]
  ret i32 %cond
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
