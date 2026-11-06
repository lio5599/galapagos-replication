; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/0_b64_byte_to_char_9.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/0_b64_byte_to_char_9.c"
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
  %g26 = alloca i32, align 4
  %g52 = alloca i32, align 4
  %g62 = alloca i32, align 4
  %z62 = alloca i32, align 4
  %z63 = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  %sub1 = sub i32 255, %and
  store i32 %sub1, ptr %g26, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub2 = sub i32 %1, 52
  %shr3 = lshr i32 %sub2, 8
  %and4 = and i32 %shr3, 255
  %sub5 = sub i32 255, %and4
  store i32 %sub5, ptr %g52, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub6 = sub i32 %2, 62
  %shr7 = lshr i32 %sub6, 8
  %and8 = and i32 %shr7, 255
  %sub9 = sub i32 255, %and8
  store i32 %sub9, ptr %g62, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %sub10 = sub i32 0, %xor
  %shr11 = lshr i32 %sub10, 8
  %and12 = and i32 %shr11, 255
  store i32 %and12, ptr %z62, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor13 = xor i32 %4, 63
  %sub14 = sub i32 0, %xor13
  %shr15 = lshr i32 %sub14, 8
  %and16 = and i32 %shr15, 255
  store i32 %and16, ptr %z63, align 4
  %5 = load i32, ptr %g26, align 4
  %sub17 = sub i32 255, %5
  %6 = load i32, ptr %x.addr, align 4
  %add = add i32 %6, 65
  %and18 = and i32 %sub17, %add
  %7 = load i32, ptr %g26, align 4
  %8 = load i32, ptr %g52, align 4
  %sub19 = sub i32 255, %8
  %and20 = and i32 %7, %sub19
  %9 = load i32, ptr %x.addr, align 4
  %add21 = add i32 %9, 71
  %and22 = and i32 %and20, %add21
  %or = or i32 %and18, %and22
  %10 = load i32, ptr %g52, align 4
  %11 = load i32, ptr %g62, align 4
  %sub23 = sub i32 255, %11
  %and24 = and i32 %10, %sub23
  %12 = load i32, ptr %x.addr, align 4
  %sub25 = sub i32 %12, 4
  %and26 = and i32 %and24, %sub25
  %or27 = or i32 %or, %and26
  %13 = load i32, ptr %z62, align 4
  %sub28 = sub i32 255, %13
  %and29 = and i32 %sub28, 43
  %or30 = or i32 %or27, %and29
  %14 = load i32, ptr %z63, align 4
  %sub31 = sub i32 255, %14
  %and32 = and i32 %sub31, 47
  %or33 = or i32 %or30, %and32
  ret i32 %or33
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
