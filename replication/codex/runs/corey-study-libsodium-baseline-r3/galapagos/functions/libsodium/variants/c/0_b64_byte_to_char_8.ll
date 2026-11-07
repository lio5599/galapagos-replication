; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r3/functions/libsodium/variants/c/0_b64_byte_to_char_8.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r3/functions/libsodium/variants/c/0_b64_byte_to_char_8.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  %upper = alloca i32, align 4
  %lower = alloca i32, align 4
  %digit = alloca i32, align 4
  %result = alloca i32, align 4
  %bit = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  store i32 %and, ptr %a, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  %and3 = and i32 %shr2, 255
  store i32 %and3, ptr %b, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub4 = sub i32 %2, 62
  %shr5 = lshr i32 %sub4, 8
  %and6 = and i32 %shr5, 255
  store i32 %and6, ptr %c, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %sub7 = sub i32 0, %xor
  %shr8 = lshr i32 %sub7, 8
  %not = xor i32 %shr8, -1
  %and9 = and i32 %not, 255
  store i32 %and9, ptr %d, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor10 = xor i32 %4, 63
  %sub11 = sub i32 0, %xor10
  %shr12 = lshr i32 %sub11, 8
  %not13 = xor i32 %shr12, -1
  %and14 = and i32 %not13, 255
  store i32 %and14, ptr %e, align 4
  %5 = load i32, ptr %x.addr, align 4
  %add = add i32 %5, 65
  store i32 %add, ptr %upper, align 4
  %6 = load i32, ptr %x.addr, align 4
  %add15 = add i32 %6, 71
  store i32 %add15, ptr %lower, align 4
  %7 = load i32, ptr %x.addr, align 4
  %add16 = add i32 %7, -4
  store i32 %add16, ptr %digit, align 4
  store i32 0, ptr %result, align 4
  store i32 1, ptr %bit, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i32, ptr %bit, align 4
  %cmp = icmp ult i32 %8, 256
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %9 = load i32, ptr %a, align 4
  %10 = load i32, ptr %bit, align 4
  %and17 = and i32 %9, %10
  %tobool = icmp ne i32 %and17, 0
  br i1 %tobool, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %for.body
  %11 = load i32, ptr %upper, align 4
  %12 = load i32, ptr %bit, align 4
  %and18 = and i32 %11, %12
  %tobool19 = icmp ne i32 %and18, 0
  br i1 %tobool19, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %for.body
  %13 = load i32, ptr %a, align 4
  %not20 = xor i32 %13, -1
  %14 = load i32, ptr %b, align 4
  %and21 = and i32 %not20, %14
  %15 = load i32, ptr %bit, align 4
  %and22 = and i32 %and21, %15
  %tobool23 = icmp ne i32 %and22, 0
  br i1 %tobool23, label %land.lhs.true24, label %lor.lhs.false27

land.lhs.true24:                                  ; preds = %lor.lhs.false
  %16 = load i32, ptr %lower, align 4
  %17 = load i32, ptr %bit, align 4
  %and25 = and i32 %16, %17
  %tobool26 = icmp ne i32 %and25, 0
  br i1 %tobool26, label %if.then, label %lor.lhs.false27

lor.lhs.false27:                                  ; preds = %land.lhs.true24, %lor.lhs.false
  %18 = load i32, ptr %b, align 4
  %not28 = xor i32 %18, -1
  %19 = load i32, ptr %c, align 4
  %and29 = and i32 %not28, %19
  %20 = load i32, ptr %bit, align 4
  %and30 = and i32 %and29, %20
  %tobool31 = icmp ne i32 %and30, 0
  br i1 %tobool31, label %land.lhs.true32, label %lor.lhs.false35

land.lhs.true32:                                  ; preds = %lor.lhs.false27
  %21 = load i32, ptr %digit, align 4
  %22 = load i32, ptr %bit, align 4
  %and33 = and i32 %21, %22
  %tobool34 = icmp ne i32 %and33, 0
  br i1 %tobool34, label %if.then, label %lor.lhs.false35

lor.lhs.false35:                                  ; preds = %land.lhs.true32, %lor.lhs.false27
  %23 = load i32, ptr %d, align 4
  %24 = load i32, ptr %bit, align 4
  %and36 = and i32 %23, %24
  %tobool37 = icmp ne i32 %and36, 0
  br i1 %tobool37, label %land.lhs.true38, label %lor.lhs.false41

land.lhs.true38:                                  ; preds = %lor.lhs.false35
  %25 = load i32, ptr %bit, align 4
  %and39 = and i32 43, %25
  %tobool40 = icmp ne i32 %and39, 0
  br i1 %tobool40, label %if.then, label %lor.lhs.false41

lor.lhs.false41:                                  ; preds = %land.lhs.true38, %lor.lhs.false35
  %26 = load i32, ptr %e, align 4
  %27 = load i32, ptr %bit, align 4
  %and42 = and i32 %26, %27
  %tobool43 = icmp ne i32 %and42, 0
  br i1 %tobool43, label %land.lhs.true44, label %if.end

land.lhs.true44:                                  ; preds = %lor.lhs.false41
  %28 = load i32, ptr %bit, align 4
  %and45 = and i32 47, %28
  %tobool46 = icmp ne i32 %and45, 0
  br i1 %tobool46, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true44, %land.lhs.true38, %land.lhs.true32, %land.lhs.true24, %land.lhs.true
  %29 = load i32, ptr %bit, align 4
  %30 = load i32, ptr %result, align 4
  %or = or i32 %30, %29
  store i32 %or, ptr %result, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true44, %lor.lhs.false41
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %31 = load i32, ptr %bit, align 4
  %shl = shl i32 %31, 1
  store i32 %shl, ptr %bit, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %32 = load i32, ptr %result, align 4
  ret i32 %32
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
