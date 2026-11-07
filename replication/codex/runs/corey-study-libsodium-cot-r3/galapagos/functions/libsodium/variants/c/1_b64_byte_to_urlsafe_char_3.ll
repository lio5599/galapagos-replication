; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r3/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_3.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r3/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_3.c"
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
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  %result = alloca i32, align 4
  %bit = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  store i32 %shr, ptr %a, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  store i32 %shr2, ptr %b, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub3 = sub i32 %2, 62
  %shr4 = lshr i32 %sub3, 8
  store i32 %shr4, ptr %c, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %sub5 = sub i32 0, %xor
  %shr6 = lshr i32 %sub5, 8
  store i32 %shr6, ptr %d, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor7 = xor i32 %4, 63
  %sub8 = sub i32 0, %xor7
  %shr9 = lshr i32 %sub8, 8
  store i32 %shr9, ptr %e, align 4
  store i32 0, ptr %result, align 4
  store i32 1, ptr %bit, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i32, ptr %bit, align 4
  %cmp = icmp ult i32 %5, 256
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i32, ptr %a, align 4
  %7 = load i32, ptr %bit, align 4
  %and = and i32 %6, %7
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %for.body
  %8 = load i32, ptr %x.addr, align 4
  %add = add i32 %8, 65
  %9 = load i32, ptr %bit, align 4
  %and10 = and i32 %add, %9
  %tobool11 = icmp ne i32 %and10, 0
  br i1 %tobool11, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %for.body
  %10 = load i32, ptr %a, align 4
  %not = xor i32 %10, -1
  %11 = load i32, ptr %bit, align 4
  %and12 = and i32 %not, %11
  %tobool13 = icmp ne i32 %and12, 0
  br i1 %tobool13, label %land.lhs.true14, label %lor.lhs.false21

land.lhs.true14:                                  ; preds = %lor.lhs.false
  %12 = load i32, ptr %b, align 4
  %13 = load i32, ptr %bit, align 4
  %and15 = and i32 %12, %13
  %tobool16 = icmp ne i32 %and15, 0
  br i1 %tobool16, label %land.lhs.true17, label %lor.lhs.false21

land.lhs.true17:                                  ; preds = %land.lhs.true14
  %14 = load i32, ptr %x.addr, align 4
  %add18 = add i32 %14, 71
  %15 = load i32, ptr %bit, align 4
  %and19 = and i32 %add18, %15
  %tobool20 = icmp ne i32 %and19, 0
  br i1 %tobool20, label %if.then, label %lor.lhs.false21

lor.lhs.false21:                                  ; preds = %land.lhs.true17, %land.lhs.true14, %lor.lhs.false
  %16 = load i32, ptr %b, align 4
  %not22 = xor i32 %16, -1
  %17 = load i32, ptr %bit, align 4
  %and23 = and i32 %not22, %17
  %tobool24 = icmp ne i32 %and23, 0
  br i1 %tobool24, label %land.lhs.true25, label %lor.lhs.false32

land.lhs.true25:                                  ; preds = %lor.lhs.false21
  %18 = load i32, ptr %c, align 4
  %19 = load i32, ptr %bit, align 4
  %and26 = and i32 %18, %19
  %tobool27 = icmp ne i32 %and26, 0
  br i1 %tobool27, label %land.lhs.true28, label %lor.lhs.false32

land.lhs.true28:                                  ; preds = %land.lhs.true25
  %20 = load i32, ptr %x.addr, align 4
  %add29 = add i32 %20, -4
  %21 = load i32, ptr %bit, align 4
  %and30 = and i32 %add29, %21
  %tobool31 = icmp ne i32 %and30, 0
  br i1 %tobool31, label %if.then, label %lor.lhs.false32

lor.lhs.false32:                                  ; preds = %land.lhs.true28, %land.lhs.true25, %lor.lhs.false21
  %22 = load i32, ptr %d, align 4
  %not33 = xor i32 %22, -1
  %23 = load i32, ptr %bit, align 4
  %and34 = and i32 %not33, %23
  %tobool35 = icmp ne i32 %and34, 0
  br i1 %tobool35, label %land.lhs.true36, label %lor.lhs.false39

land.lhs.true36:                                  ; preds = %lor.lhs.false32
  %24 = load i32, ptr %bit, align 4
  %and37 = and i32 45, %24
  %tobool38 = icmp ne i32 %and37, 0
  br i1 %tobool38, label %if.then, label %lor.lhs.false39

lor.lhs.false39:                                  ; preds = %land.lhs.true36, %lor.lhs.false32
  %25 = load i32, ptr %e, align 4
  %not40 = xor i32 %25, -1
  %26 = load i32, ptr %bit, align 4
  %and41 = and i32 %not40, %26
  %tobool42 = icmp ne i32 %and41, 0
  br i1 %tobool42, label %land.lhs.true43, label %if.end

land.lhs.true43:                                  ; preds = %lor.lhs.false39
  %27 = load i32, ptr %bit, align 4
  %and44 = and i32 95, %27
  %tobool45 = icmp ne i32 %and44, 0
  br i1 %tobool45, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true43, %land.lhs.true36, %land.lhs.true28, %land.lhs.true17, %land.lhs.true
  %28 = load i32, ptr %bit, align 4
  %29 = load i32, ptr %result, align 4
  %or = or i32 %29, %28
  store i32 %or, ptr %result, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true43, %lor.lhs.false39
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %30 = load i32, ptr %bit, align 4
  %shl = shl i32 %30, 1
  store i32 %shl, ptr %bit, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %31 = load i32, ptr %result, align 4
  ret i32 %31
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
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
