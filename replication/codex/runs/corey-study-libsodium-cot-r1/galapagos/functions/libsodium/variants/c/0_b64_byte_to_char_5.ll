; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r1/functions/libsodium/variants/c/0_b64_byte_to_char_5.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r1/functions/libsodium/variants/c/0_b64_byte_to_char_5.c"
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
  %va = alloca i32, align 4
  %vb = alloca i32, align 4
  %vc = alloca i32, align 4
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
  %and9 = and i32 %shr8, 255
  %xor10 = xor i32 %and9, 255
  store i32 %xor10, ptr %d, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor11 = xor i32 %4, 63
  %sub12 = sub i32 0, %xor11
  %shr13 = lshr i32 %sub12, 8
  %and14 = and i32 %shr13, 255
  %xor15 = xor i32 %and14, 255
  store i32 %xor15, ptr %e, align 4
  %5 = load i32, ptr %x.addr, align 4
  %add = add i32 %5, 65
  store i32 %add, ptr %va, align 4
  %6 = load i32, ptr %x.addr, align 4
  %add16 = add i32 %6, 71
  store i32 %add16, ptr %vb, align 4
  %7 = load i32, ptr %x.addr, align 4
  %add17 = add i32 %7, -4
  store i32 %add17, ptr %vc, align 4
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
  %and18 = and i32 %9, %10
  %tobool = icmp ne i32 %and18, 0
  br i1 %tobool, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %for.body
  %11 = load i32, ptr %va, align 4
  %12 = load i32, ptr %bit, align 4
  %and19 = and i32 %11, %12
  %tobool20 = icmp ne i32 %and19, 0
  br i1 %tobool20, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %for.body
  %13 = load i32, ptr %a, align 4
  %14 = load i32, ptr %bit, align 4
  %and21 = and i32 %13, %14
  %tobool22 = icmp ne i32 %and21, 0
  br i1 %tobool22, label %lor.lhs.false29, label %land.lhs.true23

land.lhs.true23:                                  ; preds = %lor.lhs.false
  %15 = load i32, ptr %b, align 4
  %16 = load i32, ptr %bit, align 4
  %and24 = and i32 %15, %16
  %tobool25 = icmp ne i32 %and24, 0
  br i1 %tobool25, label %land.lhs.true26, label %lor.lhs.false29

land.lhs.true26:                                  ; preds = %land.lhs.true23
  %17 = load i32, ptr %vb, align 4
  %18 = load i32, ptr %bit, align 4
  %and27 = and i32 %17, %18
  %tobool28 = icmp ne i32 %and27, 0
  br i1 %tobool28, label %if.then, label %lor.lhs.false29

lor.lhs.false29:                                  ; preds = %land.lhs.true26, %land.lhs.true23, %lor.lhs.false
  %19 = load i32, ptr %b, align 4
  %20 = load i32, ptr %bit, align 4
  %and30 = and i32 %19, %20
  %tobool31 = icmp ne i32 %and30, 0
  br i1 %tobool31, label %lor.lhs.false38, label %land.lhs.true32

land.lhs.true32:                                  ; preds = %lor.lhs.false29
  %21 = load i32, ptr %c, align 4
  %22 = load i32, ptr %bit, align 4
  %and33 = and i32 %21, %22
  %tobool34 = icmp ne i32 %and33, 0
  br i1 %tobool34, label %land.lhs.true35, label %lor.lhs.false38

land.lhs.true35:                                  ; preds = %land.lhs.true32
  %23 = load i32, ptr %vc, align 4
  %24 = load i32, ptr %bit, align 4
  %and36 = and i32 %23, %24
  %tobool37 = icmp ne i32 %and36, 0
  br i1 %tobool37, label %if.then, label %lor.lhs.false38

lor.lhs.false38:                                  ; preds = %land.lhs.true35, %land.lhs.true32, %lor.lhs.false29
  %25 = load i32, ptr %d, align 4
  %26 = load i32, ptr %bit, align 4
  %and39 = and i32 %25, %26
  %tobool40 = icmp ne i32 %and39, 0
  br i1 %tobool40, label %land.lhs.true41, label %lor.lhs.false44

land.lhs.true41:                                  ; preds = %lor.lhs.false38
  %27 = load i32, ptr %bit, align 4
  %and42 = and i32 43, %27
  %tobool43 = icmp ne i32 %and42, 0
  br i1 %tobool43, label %if.then, label %lor.lhs.false44

lor.lhs.false44:                                  ; preds = %land.lhs.true41, %lor.lhs.false38
  %28 = load i32, ptr %e, align 4
  %29 = load i32, ptr %bit, align 4
  %and45 = and i32 %28, %29
  %tobool46 = icmp ne i32 %and45, 0
  br i1 %tobool46, label %land.lhs.true47, label %if.end

land.lhs.true47:                                  ; preds = %lor.lhs.false44
  %30 = load i32, ptr %bit, align 4
  %and48 = and i32 47, %30
  %tobool49 = icmp ne i32 %and48, 0
  br i1 %tobool49, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true47, %land.lhs.true41, %land.lhs.true35, %land.lhs.true26, %land.lhs.true
  %31 = load i32, ptr %bit, align 4
  %32 = load i32, ptr %result, align 4
  %or = or i32 %32, %31
  store i32 %or, ptr %result, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true47, %lor.lhs.false44
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %33 = load i32, ptr %bit, align 4
  %shl = shl i32 %33, 1
  store i32 %shl, ptr %bit, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %34 = load i32, ptr %result, align 4
  ret i32 %34
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
