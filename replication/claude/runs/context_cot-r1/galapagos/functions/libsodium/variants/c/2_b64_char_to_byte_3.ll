; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_3.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_3.c"
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
  %a = alloca i32, align 4
  %l = alloca i32, align 4
  %d = alloca i32, align 4
  %p = alloca i32, align 4
  %s = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  %sub1 = sub i32 255, %and
  %2 = load i32, ptr %u, align 4
  %sub2 = sub i32 90, %2
  %shr3 = lshr i32 %sub2, 8
  %and4 = and i32 %shr3, 255
  %sub5 = sub i32 255, %and4
  %and6 = and i32 %sub1, %sub5
  %3 = load i32, ptr %u, align 4
  %sub7 = sub i32 %3, 65
  %and8 = and i32 %and6, %sub7
  store i32 %and8, ptr %a, align 4
  %4 = load i32, ptr %u, align 4
  %sub9 = sub i32 %4, 97
  %shr10 = lshr i32 %sub9, 8
  %and11 = and i32 %shr10, 255
  %sub12 = sub i32 255, %and11
  %5 = load i32, ptr %u, align 4
  %sub13 = sub i32 122, %5
  %shr14 = lshr i32 %sub13, 8
  %and15 = and i32 %shr14, 255
  %sub16 = sub i32 255, %and15
  %and17 = and i32 %sub12, %sub16
  %6 = load i32, ptr %u, align 4
  %sub18 = sub i32 %6, 71
  %and19 = and i32 %and17, %sub18
  store i32 %and19, ptr %l, align 4
  %7 = load i32, ptr %u, align 4
  %sub20 = sub i32 %7, 48
  %shr21 = lshr i32 %sub20, 8
  %and22 = and i32 %shr21, 255
  %sub23 = sub i32 255, %and22
  %8 = load i32, ptr %u, align 4
  %sub24 = sub i32 57, %8
  %shr25 = lshr i32 %sub24, 8
  %and26 = and i32 %shr25, 255
  %sub27 = sub i32 255, %and26
  %and28 = and i32 %sub23, %sub27
  %9 = load i32, ptr %u, align 4
  %add = add i32 %9, 4
  %and29 = and i32 %and28, %add
  store i32 %and29, ptr %d, align 4
  %10 = load i32, ptr %u, align 4
  %xor = xor i32 %10, 43
  %sub30 = sub i32 0, %xor
  %shr31 = lshr i32 %sub30, 8
  %and32 = and i32 %shr31, 255
  %sub33 = sub i32 255, %and32
  %and34 = and i32 %sub33, 62
  store i32 %and34, ptr %p, align 4
  %11 = load i32, ptr %u, align 4
  %xor35 = xor i32 %11, 47
  %sub36 = sub i32 0, %xor35
  %shr37 = lshr i32 %sub36, 8
  %and38 = and i32 %shr37, 255
  %sub39 = sub i32 255, %and38
  %and40 = and i32 %sub39, 63
  store i32 %and40, ptr %s, align 4
  %12 = load i32, ptr %a, align 4
  %13 = load i32, ptr %l, align 4
  %or = or i32 %12, %13
  %14 = load i32, ptr %d, align 4
  %or41 = or i32 %or, %14
  %15 = load i32, ptr %p, align 4
  %or42 = or i32 %or41, %15
  %16 = load i32, ptr %s, align 4
  %or43 = or i32 %or42, %16
  store i32 %or43, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %18 = load i32, ptr %x, align 4
  %sub44 = sub i32 0, %18
  %shr45 = lshr i32 %sub44, 8
  %and46 = and i32 %shr45, 255
  %sub47 = sub i32 255, %and46
  %19 = load i32, ptr %u, align 4
  %xor48 = xor i32 %19, 65
  %sub49 = sub i32 0, %xor48
  %shr50 = lshr i32 %sub49, 8
  %and51 = and i32 %shr50, 255
  %and52 = and i32 %sub47, %and51
  %or53 = or i32 %17, %and52
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
