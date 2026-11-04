; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_2.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_char_to_byte(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_char_to_byte(i32 noundef %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  %u = alloca i32, align 4
  %a1 = alloca i32, align 4
  %a2 = alloca i32, align 4
  %b1 = alloca i32, align 4
  %b2 = alloca i32, align 4
  %d1 = alloca i32, align 4
  %d2 = alloca i32, align 4
  %ep = alloca i32, align 4
  %es = alloca i32, align 4
  %x = alloca i32, align 4
  %ez = alloca i32, align 4
  %nA = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  %sub1 = sub i32 255, %and
  store i32 %sub1, ptr %a1, align 4
  %2 = load i32, ptr %u, align 4
  %sub2 = sub i32 90, %2
  %shr3 = lshr i32 %sub2, 8
  %and4 = and i32 %shr3, 255
  %sub5 = sub i32 255, %and4
  store i32 %sub5, ptr %a2, align 4
  %3 = load i32, ptr %u, align 4
  %sub6 = sub i32 %3, 97
  %shr7 = lshr i32 %sub6, 8
  %and8 = and i32 %shr7, 255
  %sub9 = sub i32 255, %and8
  store i32 %sub9, ptr %b1, align 4
  %4 = load i32, ptr %u, align 4
  %sub10 = sub i32 122, %4
  %shr11 = lshr i32 %sub10, 8
  %and12 = and i32 %shr11, 255
  %sub13 = sub i32 255, %and12
  store i32 %sub13, ptr %b2, align 4
  %5 = load i32, ptr %u, align 4
  %sub14 = sub i32 %5, 48
  %shr15 = lshr i32 %sub14, 8
  %and16 = and i32 %shr15, 255
  %sub17 = sub i32 255, %and16
  store i32 %sub17, ptr %d1, align 4
  %6 = load i32, ptr %u, align 4
  %sub18 = sub i32 57, %6
  %shr19 = lshr i32 %sub18, 8
  %and20 = and i32 %shr19, 255
  %sub21 = sub i32 255, %and20
  store i32 %sub21, ptr %d2, align 4
  %7 = load i32, ptr %u, align 4
  %xor = xor i32 %7, 43
  %sub22 = sub i32 0, %xor
  %shr23 = lshr i32 %sub22, 8
  %and24 = and i32 %shr23, 255
  %sub25 = sub i32 255, %and24
  store i32 %sub25, ptr %ep, align 4
  %8 = load i32, ptr %u, align 4
  %xor26 = xor i32 %8, 47
  %sub27 = sub i32 0, %xor26
  %shr28 = lshr i32 %sub27, 8
  %and29 = and i32 %shr28, 255
  %sub30 = sub i32 255, %and29
  store i32 %sub30, ptr %es, align 4
  %9 = load i32, ptr %a1, align 4
  %10 = load i32, ptr %a2, align 4
  %and31 = and i32 %9, %10
  %11 = load i32, ptr %u, align 4
  %sub32 = sub i32 %11, 65
  %and33 = and i32 %and31, %sub32
  %12 = load i32, ptr %b1, align 4
  %13 = load i32, ptr %b2, align 4
  %and34 = and i32 %12, %13
  %14 = load i32, ptr %u, align 4
  %sub35 = sub i32 %14, 71
  %and36 = and i32 %and34, %sub35
  %or = or i32 %and33, %and36
  %15 = load i32, ptr %d1, align 4
  %16 = load i32, ptr %d2, align 4
  %and37 = and i32 %15, %16
  %17 = load i32, ptr %u, align 4
  %add = add i32 %17, 4
  %and38 = and i32 %and37, %add
  %or39 = or i32 %or, %and38
  %18 = load i32, ptr %ep, align 4
  %and40 = and i32 %18, 62
  %or41 = or i32 %or39, %and40
  %19 = load i32, ptr %es, align 4
  %and42 = and i32 %19, 63
  %or43 = or i32 %or41, %and42
  store i32 %or43, ptr %x, align 4
  %20 = load i32, ptr %x, align 4
  %sub44 = sub i32 0, %20
  %shr45 = lshr i32 %sub44, 8
  %and46 = and i32 %shr45, 255
  %sub47 = sub i32 255, %and46
  store i32 %sub47, ptr %ez, align 4
  %21 = load i32, ptr %u, align 4
  %xor48 = xor i32 %21, 65
  %sub49 = sub i32 0, %xor48
  %shr50 = lshr i32 %sub49, 8
  %and51 = and i32 %shr50, 255
  store i32 %and51, ptr %nA, align 4
  %22 = load i32, ptr %x, align 4
  %23 = load i32, ptr %ez, align 4
  %24 = load i32, ptr %nA, align 4
  %and52 = and i32 %23, %24
  %or53 = or i32 %22, %and52
  ret i32 %or53
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
